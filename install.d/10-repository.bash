# Register repositories
sudo bash -c '
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    gpg --keyserver pgpkeys.mit.edu --recv-key 3EE67F3D0FF405B2
    gpg -a --export 3EE67F3D0FF405B2 | apt-key add -
'

cat <<EOL | sudo tee /etc/apt/sources.list.d/contrib.list
# Auto-generated
# Contrib (Debian ${DEBIAN_VER} "${DEBIAN_REL}")
deb http://httpredir.debian.org/debian/ ${DEBIAN_REL} main contrib non-free
EOL

cat <<EOL | sudo tee /etc/apt/sources.list.d/docker.list
# Auto-generated
# Docker (Debian ${DEBIAN_VER} "${DEBIAN_REL}")
deb https://apt.dockerproject.org/repo debian-${DEBIAN_REL} main
EOL

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt-get update
