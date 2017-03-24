# Support HTTPS
sudo apt-get install -y apt-transport-https

# Install packages
sudo apt-get install -y \
    linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') virtualbox vagrant \
    $(cat "${INSTALLER_DIR}/conf.d/20-packages.txt" | grep -vE '^#')

