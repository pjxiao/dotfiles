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
        SYSTEM_PYTHON=$(which python2)
        __hg_branch ()
        {
            local repo="$(__find_hg_repo $(pwd))"
            echo $repo
            if [ -n "${repo}" ]; then
                echo -n "($(${SYSTEM_PYTHON} ${DOTFILES_DIR}/scripts/hg_repo.py))"
            fi
        }

        PS1='$(__hg_branch)'$PS1
    fi

    __prompt_command ()
    {
        local pwd=$(pwd)
        # PROMPT COMMAND
    }


    PROMPT_COMMAND="__prompt_command;$PROMPT_COMMAND"
fi
