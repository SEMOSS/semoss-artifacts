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

