which virtualenvwrapper.sh >/dev/null 2>&1 && source virtualenvwrapper.sh
grep -E '\sworkon$' <(declare -F) >/dev/null 2>&1 && alias wo='workon'
