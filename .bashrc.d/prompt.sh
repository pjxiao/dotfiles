if [ -n "$PS1" ]
then
    ps --no-header >/dev/null 2>&1 &&  ps --no-headers | awk '{ print $4 }' | grep -q vim &&\
        PS1="(\[\e[;32m\]VIM\[\e[00m\])"$PS1

    __print_branch ()
    {
        # marks: Ꝩ   𐌖  𝛄
        local mark=''
        echo -n "(${mark}${1})"
        echo "${1}" | grep -qE '^[mt][0-9]+' && \
            echo -n "${1}" | perl -pe 's/^[mt]([0-9]+).*/(#\1)/' | tr -d "\n"
    }

    if $(grep -qE '\s__git_ps1$' <(declare -F))
    then
        __git_branch ()
        {
            branch=$(__git_ps1 | sed -e "s/[[:space:]\r]//g" | sed -e 's/^(\+//' | sed -e 's/)\+$//' | tr -d "\r")
            [ -n "${branch}" ] && __print_branch ${branch}
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
                    local branch=$(cat "${repo}/.hg/branch")
                else
                    local branch=default
                fi
                __print_branch ${branch}
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
