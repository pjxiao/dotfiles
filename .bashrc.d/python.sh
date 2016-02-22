which virtualenvwrapper.sh >/dev/null 2>&1 && \
    python -c 'import virtualenvwrapper' >/dev/null 2>&1 && \
    source virtualenvwrapper.sh

# http://askubuntu.com/a/25606
export PYTHONSTARTUP="${DOTFILES_DIR}/.pythonrc"
