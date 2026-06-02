if [[ -z "${CHROOT_ENABLE}" ]];
then echo "No defined chroot enabled"
else
sed -i "s@CHROOT_ENABLE.*@CHROOT_ENABLE\t$CHROOT_ENABLE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${CHROOT_DIR}" ]];
then echo "No defined chroot dir"
else
sed -i "s@CHROOT_DIR.*@CHROOT_DIR\t$CHROOT_DIR@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${CHROOT_DEBOOTSTRAP_DIR}" ]];
then echo "No defined chroot debootstrap dir"
else
sed -i "s@CHROOT_DEBOOTSTRAP_DIR.*@CHROOT_DEBOOTSTRAP_DIR\t$CHROOT_DEBOOTSTRAP_DIR@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${CHROOT_SUDO}" ]];
then echo "No defined chroot sudo"
else
sed -i "s@CHROOT_SUDO.*@CHROOT_SUDO\t$CHROOT_SUDO@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${CHROOT_SYMLINK_PATHS}" ]];
then echo "No defined chroot symlink paths"
else
sed -i "s@CHROOT_SYMLINK_PATHS.*@CHROOT_SYMLINK_PATHS\t$CHROOT_SYMLINK_PATHS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SANDBOX_MODE}" && -n "${CHROOT_SANDBOX_MODE}" ]];
then SANDBOX_MODE="$CHROOT_SANDBOX_MODE"
fi

if [[ -z "${SANDBOX_MODE}" ]];
then echo "No defined sandbox mode"
else
sed -i "s@SANDBOX_MODE.*@SANDBOX_MODE\t$SANDBOX_MODE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SANDBOX_IO_DIR}" ]];
then echo "No defined sandbox io dir"
else
sed -i "s@SANDBOX_IO_DIR.*@SANDBOX_IO_DIR\t$SANDBOX_IO_DIR@g" /opt/semosshome/RDF_Map.prop
fi
