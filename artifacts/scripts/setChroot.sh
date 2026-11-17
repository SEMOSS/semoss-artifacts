if [[ -z "${CHROOT_ENABLE}" ]];
then echo "No defined chroot enabled"
else
sed -i "s@^CHROOT_ENABLE.*@CHROOT_ENABLE\t$CHROOT_ENABLE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${CHROOT_DIR}" ]];
then echo "No defined chroot dir"
else
sed -i "s@^CHROOT_DIR.*@CHROOT_DIR\t$CHROOT_DIR@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${CHROOT_SYMLINK_PATHS}" ]];
then echo "No defined chroot symlink paths"
else
sed -i "s@^CHROOT_SYMLINK_PATHS.*@CHROOT_SYMLINK_PATHS\t$CHROOT_SYMLINK_PATHS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SANDBOX_MODE}" && -n "${CHROOT_SANDBOX_MODE}" ]];
then SANDBOX_MODE="$CHROOT_SANDBOX_MODE"
fi

if [[ -z "${SANDBOX_MODE}" ]];
then echo "No defined sandbox mode"
else
sed -i "s@^SANDBOX_MODE.*@SANDBOX_MODE\t$SANDBOX_MODE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SANDBOX_PATH}" ]];
then echo "No defined sandbox path"
else
sed -i "s@^SANDBOX_PATH.*@SANDBOX_PATH\t$SANDBOX_PATH@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SANDBOX_IO_DIR}" ]];
then echo "No defined sandbox io dir"
else
sed -i "s@^SANDBOX_IO_DIR.*@SANDBOX_IO_DIR\t$SANDBOX_IO_DIR@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SANDBOX_ENV_ALLOWLIST}" ]];
then echo "No defined sandbox env allowlist"
else
sed -i "s@^SANDBOX_ENV_ALLOWLIST.*@SANDBOX_ENV_ALLOWLIST\t$SANDBOX_ENV_ALLOWLIST@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${NAMESPACE_SCRUB_ENV}" ]];
then echo "No defined namespace scrub env flag"
else
sed -i "s@^NAMESPACE_SCRUB_ENV.*@NAMESPACE_SCRUB_ENV\t$NAMESPACE_SCRUB_ENV@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${NAMESPACE_EXEC_FALLBACK}" ]];
then echo "No defined namespace exec fallback"
else
sed -i "s@^NAMESPACE_EXEC_FALLBACK.*@NAMESPACE_EXEC_FALLBACK\t$NAMESPACE_EXEC_FALLBACK@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${PROJECT_REACTOR_SHARED_PACKAGES}" ]];
then echo "No defined project reactor shared packages"
else
sed -i "s@^PROJECT_REACTOR_SHARED_PACKAGES.*@PROJECT_REACTOR_SHARED_PACKAGES\t$PROJECT_REACTOR_SHARED_PACKAGES@g" /opt/semosshome/RDF_Map.prop
fi
