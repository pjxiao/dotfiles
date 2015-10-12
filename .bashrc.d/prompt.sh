[ -n "$PS1" ] &&\
    ps --no-headers | awk '{ print $4 }' | grep -q vim &&\
    PS1="(\[\e[;32m\]VIM\[\e[00m\])"$PS1
