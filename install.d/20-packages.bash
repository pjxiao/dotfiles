# Install packages via apt
sudo apt-get install -y \
    linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') \
    $(cat "${INSTALLER_DIR}/conf.d/20-packages.txt" | grep -vE '^#') \
    $(cat "${INSTALLER_DIR}/conf.d/20-packages-${DEBIAN_REL}.txt" | grep -vE '^#')
