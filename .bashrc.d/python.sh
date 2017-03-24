which virtualenvwrapper.sh >/dev/null 2>&1 && \
    . $(which virtualenvwrapper.sh)

# http://askubuntu.com/a/25606
export PYTHONSTARTUP="${DOTFILES_DIR}/.pythonrc"
