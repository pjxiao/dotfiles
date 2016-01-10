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
            if [ -n "${repo}" ]; then
                # NOTE: /path/to/repo/.hg/branch contains branch name (Mercurial 3.6.2)
                # :see also: - ``mercurial.dirstate.dirstate._branch()``
                #            - ``vcprompt/src/hg.c#hg_get_info()``
                if [ -f "${repo}/.hg/branch" ]; then
                    echo -n "($(cat "${repo}/.hg/branch"))"
                else
                    echo -n "(default)"
                fi
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
