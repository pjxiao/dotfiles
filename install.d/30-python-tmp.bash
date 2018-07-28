# Install newer Python runtimes for vim and jedi

# Check Docker
which docker

python-tmp-install() {
    test -n "${2}" && test -d "${2}" && sudo rm -rf "${2}"
    sudo mkdir ${2}

    # retrieve python executable and libraries from a container
    docker pull python:${1}
    local container_id=$(docker create python:${1})
    sudo docker cp ${container_id}:/usr/local ${2}
    sudo mv ${2}/local/* ${2}
    docker rm ${container_id}

    # add paths
    cat <<EOL >> ${BASHRC_PART_PATH}
export LD_LIBRARY_PATH="\${LD_LIBRARY_PATH}:${2}/lib"
export LIBRARY_PATH="\${LIBRARY_PATH}:${2}/lib"
export CPATH="\${CPATH}:${2}/include"
export PATH="\${PATH}:${2}/bin"
EOL
}

python-tmp-install '3.6-slim-stretch' /opt/py36
python-tmp-install '3.7-slim-stretch' /opt/py37
