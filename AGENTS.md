# AGENTS.md — semoss-artifacts

**GitHub**: `github.com/SEMOSS/semoss-artifacts`  
**Purpose**: Production deployment glue for SEMOSS — Docker image build scripts, Maven artifact unpacking POMs, canonical config file templates, and the runtime configuration shell scripts that run inside every SEMOSS container.

---

## What this repo is

semoss-artifacts does two things:

1. **Build-time**: Downloads versioned SEMOSS Maven artifacts (Monolith WAR, semosshome, SemossWeb) and the canonical config templates (`x/`) into the Docker image.
2. **Runtime**: Provides a library of shell scripts (`artifacts/scripts/`) that translate container env vars into live config files (via `sed`) before Tomcat starts.

It is cloned into every production image at `/opt/semoss-artifacts` and its `artifacts/scripts/` directory is on `PATH`.

---

## Directory layout

```
semoss-artifacts/
├── artifacts/
│   ├── scripts/          # ~100 runtime config scripts (runCS.sh, set*.sh, custom*.sh, etc.)
│   ├── dockerBuilder_scripts/   # Maven POMs + files used only during docker build
│   │   ├── web.xml               # Injected into Monolith WAR at build time (see Dockerfile.tomcat)
│   │   ├── server.xml            # Tomcat server.xml
│   │   ├── context-*.xml         # Tomcat context configs (with/without link)
│   │   ├── semoss-pom.xml / monolith-pom.xml / semoss-ui-pom.xml   # Alternate build POMs
│   │   ├── install_java.sh
│   │   ├── install_Playwright_linux_dependencies.sh
│   │   └── download_license_jars.sh
│   ├── home/pom.xml      # Maven: downloads + unpacks semosshome tar.gz → /opt/semosshome
│   ├── war/pom.xml       # Maven: downloads + unpacks Monolith WAR → $TOMCAT_HOME/webapps/Monolith
│   ├── web/pom.xml       # Maven: downloads + unpacks SemossWeb → $TOMCAT_HOME/webapps/SemossWeb
│   ├── lib/pom.xml       # Maven: downloads + unpacks Monolith lib JARs → $TOMCAT_HOME/webapps/Monolith
│   └── cluster/pom.xml   # For cluster/multi-node builds
├── x/
│   ├── web.xml           # Canonical Monolith web.xml (deployed to WEB-INF/ at build time)
│   ├── RDF_Map.prop      # Core SEMOSS runtime config (engine watchers, data paths, feature flags)
│   ├── social.properties # OAuth/SSO provider config template (filled by setSocialProps.sh)
│   ├── log4j2.xml        # Logging config
│   └── quartz.properties # Quartz scheduler config
└── settings/
    └── settings.xml      # Maven settings for pulling from SEMOSS's Maven repo (Sonatype)
```

---

## How the Docker image is built

All production Dockerfiles (`Dockerfile.ubuntu22.04`, `.ubi8`, `.ubi9`, `.nvidia.*`) follow this two-stage pattern:

### Stage 1 — `mavenpuller`

```dockerfile
RUN cd /opt && git clone https://github.com/SEMOSS/semoss-artifacts \
    && chmod 777 /opt/semoss-artifacts/artifacts/scripts/*.sh \
    && /opt/semoss-artifacts/artifacts/scripts/update_latest_dev.sh
```

`update_latest_dev.sh` does:
1. Queries `oss.sonatype.org` for the latest published `org.semoss:monolith` version (or uses `$SEMOSS_VERSION` env var to pin a specific version).
2. Runs `mvn clean install` in each of `artifacts/home/`, `artifacts/war/`, `artifacts/web/`, `artifacts/lib/` — each POM uses the Maven dependency plugin to download and unpack the corresponding Maven artifact.
3. Copies the unpacked artifacts to their destinations:
   - `artifacts/home/semoss-*/` → `/opt/semosshome`
   - `artifacts/web/semoss-*/`  → `$TOMCAT_HOME/webapps/SemossWeb`
   - `artifacts/war/monolith-*/` → `$TOMCAT_HOME/webapps/Monolith`
   - `artifacts/lib/monolith-*/` → `$TOMCAT_HOME/webapps/Monolith`
4. Copies config templates from `x/` to their live locations:
   - `x/RDF_Map.prop`     → `/opt/semosshome/RDF_Map.prop`
   - `x/social.properties`→ `/opt/semosshome/social.properties`
   - `x/log4j2.xml`       → `/opt/semosshome/log4j2.xml`
   - `x/web.xml`          → `$TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml`

### Stage 2 — `final`

The final image copies `/opt` from the `mavenpuller` stage, installs Python/system deps, and sets:
```dockerfile
ENV PATH=$VIRTUAL_ENV/bin:$PATH:...:$JAVA_HOME/bin:/opt/semoss-artifacts/artifacts/scripts
WORKDIR /opt/semoss-artifacts/artifacts/scripts
CMD ["bash", "-c", "exec $TOMCAT_HOME/bin/start.sh"]
```

`Dockerfile.tomcat` is the exception — it clones semoss-artifacts into `/tmp/` during build, uses `dockerBuilder_scripts/web.xml` as a build-time override rather than `x/web.xml`, then discards the clone.

---

## Runtime: how containers start

The default CMD for Ubuntu/UBI images starts Tomcat directly. For deployments that need env-var-driven configuration (i.e., almost all production deployments), the container entrypoint is overridden to call one of these scripts:

### `runCS.sh` — primary production entrypoint

1. Resolves `$TOMCAT_HOME` (falls back to `/opt/apache-tomcat-8.0.41` or `9.0.26` if env var not set).
2. Stops Tomcat (`stop.sh`).
3. Reads env vars and conditionally calls `set*.sh` / `custom*.sh` scripts to mutate config files in place.
4. Calls a fixed set of "always run" scripts unconditionally at the end (e.g., `setModelInferenceLogsEnabled.sh`, `setScheduler.sh`, `setSecrets.sh`, `setR.sh`, `setPy.sh`, etc.).
5. Starts Tomcat (`start.sh`).

`runConfiguration.sh` is identical but omits `setAuditLogsEnabled.sh` and `setPlaywrightExport.sh` — it is the older variant.

`run.sh` is the minimal entrypoint: resolves `$TOMCAT_HOME` and runs `catalina.sh run` foreground with no configuration step.

---

## Config injection: the sed pattern

Every `set*.sh` script mutates a live config file using `sed -i`. Two patterns are used:

**Placeholder replacement** — `social.properties` uses `<PLACEHOLDER>` sentinels in the template:
```bash
sed -i "s/<GOOGLECLIENTID>/$GOOGLE_CLIENT_ID/g" /opt/semosshome/social.properties
```

**Line replacement** — `RDF_Map.prop` and `web.xml` use key-pattern replacement:
```bash
sed -i "s@native_login.*@native_login\t$ENABLE_NATIVE@g" /opt/semosshome/social.properties
sed -i '/<web-app.*/,/<\/web-app>/ { ... s/false/true/ }' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
```

Scripts that target `web.xml` mutate `$TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml`. Scripts that target RDF_Map mutate `/opt/semosshome/RDF_Map.prop`.

---

## Key config files

### `x/web.xml` → `$TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml`

The canonical Servlet deployment descriptor for Monolith. Contains:
- Filter chain: `SetCharacterEncoding` → `HeaderSecurityFilter` → `StartUpSuccessFilter` → `NoUserExistsFilter` → `SessionCounterExceededFilter` → `MemoryCheckFilter` → `ShareSessionFilter` → `TrustedTokenFilter` → `UserAccessKeyFilter` → `CodeAssistantFilter` → `OpenAIFilter` → `SchedulerFilter` → `AnonymousUserFilter` → `NoUserInSessionFilter` → `AccountLockedFilter` → `AdminStartupFilter` → `PublicHomeCheckFilter`
- **Commented-out** optional filters (toggled by `set*.sh` at runtime): CSRF (`<!--CSRF_FILTER_FLAG_START...END-->`), CORS (`<!--CORS_FILTER_FLAG...END-->`), SAML/SSO/CAC/PIV/Waffle — the comment delimiters are the sed targets
- Servlet mappings: `MainApplication` (`/api/*`), `TrustedTokenApplication` (`/token/*`), `AdminApplication` (`/adminconfig/*`), `SamlVerifierServlet`
- Context params: RDF-MAP path (`/opt/semosshome/RDF_Map.prop`), log4j config, anonymous users, file upload paths

### `x/RDF_Map.prop` → `/opt/semosshome/RDF_Map.prop`

Core SEMOSS backend config. Key sections:
- **Engine watchers**: `SMSSWebWatcher` (databases), `SMSSStorageWatcher`, `SMSSModelWatcher`, `SMSSVectorWatcher`, `SMSSFunctionWatcher`, `SMSSGuardrailWatcher`, `ProjectWatcher` — each defines a directory under `/opt/semosshome/` to scan for `.smss` files
- **Paths**: `BaseFolder`, `SOCIAL`, `ADDITIONAL_REACTORS`, `EMAIL_TEMPLATES`, `INSIGHT_CACHE_DIR`
- **Python/R runtime**: `NETTY_PYTHON`, `USE_PYTHON`, `PYTHONHOME`, `NATIVE_PY_SERVER`, `PY_SERVER_USER`; `USE_R`, `R_MEM_LIMIT`, `IS_USER_RSERVE`, `RSERVE_CONNECTION_POOL_SIZE`
- **Feature flags**: `MODEL_INFERENCE_LOGS_ENABLED`, `CHROOT_ENABLE`, `USER_TRACKING_ENABLED`, `PLAYWRIGHT_EXPORT`, `SECRET_STORE_ENABLED`, `VIRUS_SCANNING_ENABLED`
- **Defaults**: `DEFAULT_FRAME_TYPE`, `DEFAULT_GRID_TYPE`, `DEFAULT_INSIGHTS_RDBMS`, `SAMESITE_COOKIE`, `SCHEDULER_ENDPOINT`

### `x/social.properties` → `/opt/semosshome/social.properties`

OAuth/SSO configuration template. All values ship as `<PLACEHOLDER>` sentinels. Supports: native login, Google, GitHub, Microsoft (+ Graph API group lookup), Siteminder, ADFS, Okta, Generic OIDC, LinOTP, LDAP, CAC. Also contains SMTP configuration.

---

## Runtime env vars → script mapping (selected)

| Env var | Script called | Config file mutated |
|---|---|---|
| `SETSOCIAL=true` | `setSocialProps.sh` | `social.properties` |
| `ENABLE_CORS=<value>` | `setCors.sh` | `web.xml` (uncomments CORS filter) |
| `ENABLE_CSRF=<value>` | `setCSRF.sh` | `web.xml` (uncomments CSRF filter) |
| `REMOTE_SECURITY=true` | `setRemoteSecurity.sh` | `RDF_Map.prop` (security DB SMSS path) |
| `REMOTE_LOCALMASTER=true` | `setRemoteLocalMaster.sh` | `RDF_Map.prop` |
| `CUSTOM_LM_CONNECTION_URL=<url>` | `customLocalMasterEngine.sh` | LocalMaster SMSS file |
| `CUSTOM_SECURITY_CONNECTION_URL=<url>` | `customSecurityEngine.sh` | Security SMSS file |
| `CUSTOM_MODEL_INFERENCE_LOGS_CONNECTION_URL=<url>` | `customModelInferenceLogsEngine.sh` | Inference logs SMSS |
| `CUSTOM_PROMPT_CONNECTION_URL=<url>` | `customPromptEngine.sh` | Prompt DB SMSS |
| `CUSTOM_AUDITLOGS_CONNECTION_URL=<url>` | `customAuditLogsDatabase.sh` | Audit logs SMSS |
| `SESSION_TIMEOUT=<min>` | `setSessionTimeout.sh` | `web.xml` |
| `SESSION_LIMIT=<n>` | `setSessionLimit.sh` | `web.xml` |
| `MONOLITH_COOKIE=<name>` | `setMonolithCookie.sh` | `web.xml` |
| `ANONYMOUS_USERS=true` | `enableAnonymousUsers.sh` | `web.xml` |
| `SEMOSS_MAX_POST_SIZE=<bytes>` | `setMaxPostSize.sh` | `server.xml` |
| `FE_ROUTE=<path>` | `updateFEIndexHtml.sh` | SemossWeb `index.html` |
| `SEMOSS_VERSION=<ver>` | (read by `update_latest_dev.sh`) | pins artifact version at build |
| `AZCONN=true` or `SEMOSS_STORAGE_PROVIDER=AZURE` | `setAzureProps.sh` | `RDF_Map.prop` |

---

## Adding a new configuration parameter

1. Add the key with a default value to `x/RDF_Map.prop` (for backend config) or as a `<PLACEHOLDER>` in `x/social.properties` (for auth/social config).
2. Create a new `set<FeatureName>.sh` in `artifacts/scripts/` that uses `sed -i` to replace the value.
3. Wire it into `runCS.sh` and `runConfiguration.sh` with the appropriate env-var guard.
4. If the feature requires toggling XML content in `web.xml`, wrap the relevant XML block in comment sentinels (`<!--FLAG_START ... FLAG_END-->`) and use `sed` on those sentinels in the new script.

---

## Common gotchas

- **`runCS.sh` stops Tomcat first** — if Tomcat is not running when `runCS.sh` is called, the `stop.sh` call will error but execution continues.
- **sed delimiter selection** — scripts use `@`, `#`, or `|` as sed delimiters when values may contain `/`. Never assume a plain `/` delimiter is safe for URL-valued env vars.
- **`OPTIONAL_COOKIES` is called 3× in runCS.sh** — this is a known duplicate; the third call is the effective one. Do not remove the duplicates without testing.
- **`web.xml` is the runtime copy** — scripts mutate `$TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml`, not the template in `x/`. Changes to `x/web.xml` only take effect when the image is rebuilt.
- **Version pinning** — set `SEMOSS_VERSION` at build time (`--build-arg SEMOSS_VERSION=x.y.z`) to pin to a specific Monolith release instead of `latest`.
- **`update_latest_prod.sh` vs `update_latest_dev.sh`** — prod variant pulls from the release Maven repo instead of snapshots.
