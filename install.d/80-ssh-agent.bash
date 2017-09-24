_systemd_user=${HOME}/.config/systemd/user

test -d "${_systemd_user}" || \
    mkdir -p "${_systemd_user}"
test -f "${_systemd_user}/ssh-agent.service" || \
    cp -v "${INSTALLER_DIR}/conf.d/80-ssh-agent.service" \
        "${_systemd_user}/ssh-agent.service"

cat <<'EOL' >> ${BASHRC_PART_PATH}
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
EOL

unset _systemd_user
