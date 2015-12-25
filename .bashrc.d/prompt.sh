if [ -n "$PS1" ]
then
    ps --no-headers | awk '{ print $4 }' | grep -q vim &&\
        PS1="(\[\e[;32m\]VIM\[\e[00m\])"$PS1

    if $(grep -qE '\s__git_ps1$' <(declare -F))
    then
        __git_branch ()
        {
            __git_ps1 | sed -e 's/^\s\+//'
        }
       PS1='$(__git_branch)'$PS1
    fi

    if $(which hg 1>/dev/null 2>&1)
    then
        # Escape system wide Python path
        PYTHON=$(which python2)
        __hg_branch ()
        {
            path=$(pwd)
            while [ ${path} != '/' ]
            do
                if [ -d "${path}/.hg" ]; then
                    echo -n "($(${PYTHON} ${DOTFILES_DIR}/scripts/hg_repo.py))"
                fi
                path=$(readlink -f "${path}/../")
            done
        }

        PS1='$(__hg_branch)'$PS1
    fi
fi
