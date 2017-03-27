# Install Python3
sudo apt-get install -y \
    python-dev \
    python-keyring \
    python-virtualenv \
    python3 \
    python3-dev \
    python3-venv

# Make virtualevns to install user-wide enabled tools
provisioned_venvs_dir="${HOME}/.provisioned_venvs"

mkdir -p ${provisioned_venvs_dir}
test -d "${provisioned_venvs_dir}/py3" || \
    virtualenv -p $(which python3) "${provisioned_venvs_dir}/py3"
test -d "${provisioned_venvs_dir}/py2" || \
    virtualenv -p $(which python2) "${provisioned_venvs_dir}/py2"
${provisioned_venvs_dir}/py3/bin/pip install -U pip
${provisioned_venvs_dir}/py2/bin/pip install -U pip

# Make blackhole to prevent accidently user-wide install a package
mkdir -p ${provisioned_venvs_dir}/blackhole/bin
touch ${provisioned_venvs_dir}/blackhole/bin/pip
chmod +x ${provisioned_venvs_dir}/blackhole/bin/pip

# Install user-wide enabled tools
${provisioned_venvs_dir}/py3/bin/pip install -U virtualenv virtualenvwrapper docker-compose
${provisioned_venvs_dir}/py2/bin/pip install -U Mercurial ansible

# Append to bashrc
cat <<EOL >> ${BASHRC_PART_PATH}
# Python:PATH
export PATH="\${PATH}:${provisioned_venvs_dir}/blackhole/bin"
export PATH="\${PATH}:${provisioned_venvs_dir}/py3/bin"
export PATH="\${PATH}:${provisioned_venvs_dir}/py2/bin"

# Python:virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=${provisioned_venvs_dir}/py3/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=${provisioned_venvs_dir}/py3/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_CLONE=${provisioned_venvs_dir}/py3/bin/virtualenv-clone
. virtualenvwrapper.sh
EOL
unset provisioned_venvs_dir
