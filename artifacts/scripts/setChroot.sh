sed -i "s@CHROOT_ENABLE.*@CHROOT_ENABLE\t$CHROOT_ENABLE@g" /opt/semosshome/RDF_Map.prop
sed -i "s@CHROOT_DIR.*@CHROOT_DIR\t$CHROOT_DIR@g" /opt/semosshome/RDF_Map.prop
sed -i "s@CHROOT_DEBOOTSTRAP_DIR.*@CHROOT_DEBOOTSTRAP_DIR\t$CHROOT_DEBOOTSTRAP_DIR@g" /opt/semosshome/RDF_Map.prop
sed -i "s@CHROOT_SUDO.*@CHROOT_SUDO\t$CHROOT_SUDO@g" /opt/semosshome/RDF_Map.prop
