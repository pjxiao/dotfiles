which virtualenvwrapper.sh >/dev/null 2>&1 && source virtualenvwrapper.sh
grep -E '\sworkon$' <(declare -F) >/dev/null 2>&1 && alias wo='workon'

# http://askubuntu.com/a/25606
export PYTHONSTARTUP="${DOTFILES_DIR}/.pythonrc"
