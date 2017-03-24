# Register repositories
sudo bash -c '
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    gpg --keyserver pgpkeys.mit.edu --recv-key 3EE67F3D0FF405B2
    gpg -a --export 3EE67F3D0FF405B2 | apt-key add -
'

cat <<EOL | sudo tee /etc/apt/sources.list.d/contrib.list
# Auto-generated
# Debian 8 "Jessie"
deb http://httpredir.debian.org/debian/ jessie main contrib
EOL

cat <<EOL | sudo tee /etc/apt/sources.list.d/docker.list
# Auto-generated
# Docker (Debian 8 "Jessie")
deb https://apt.dockerproject.org/repo debian-jessie main
EOL

cat <<EOL | sudo tee /etc/apt/sources.list.d/linux-mint.list
# Auto-generated
# Linux mint
deb http://packages.linuxmint.com debian import
EOL

