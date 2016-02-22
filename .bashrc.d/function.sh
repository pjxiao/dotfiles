respawn() {
    while :;
    do
        $*
        echo "Exit status $?"
        echo "Wating (1 sec)"
        sleep 1
        echo "Restarting..."
    done
}


__repo_checkout()
{
    if [ -n "$(__git_branch)" ]; then
        __echo_bold 'Git'
        git checkout $*
        return
    fi

    if [ -n "$(__hg_branch)" ]; then
        __echo_bold 'Mercurial'
        hg checkout $*
        return
    fi
}

__repo_diff()
{
    if [ -n "$(__git_branch)" ]; then
        __echo_bold 'Git'
        git diff
        return
    fi

    if [ -n "$(__hg_branch)" ]; then
        __echo_bold 'Mercurial'
        hg diff
        return
    fi
}


__repo_st()
{
    if [ -n "$(__git_branch)" ]; then
        __echo_bold 'Git'
        git status $*
        return
    fi

    if [ -n "$(__hg_branch)" ]; then
        __echo_bold 'Mercurial'
        hg status $*
        return
    fi
}


__repo_branches()
{
    if [ -n "$(__git_branch)" ]; then
        __echo_bold 'Git'
        git branch $*
        return
    fi

    if [ -n "$(__hg_branch)" ]; then
        __echo_bold 'Mercurial'
        hg branches $*
        return
    fi
}


__repo_fetch()
{
    if [ -n "$(__git_branch)" ]; then
        __echo_bold 'Git'
        git fetch $*
        return
    fi

    if [ -n "$(__hg_branch)" ]; then
        __echo_bold 'Mercurial'
        hg pull $*
        return
    fi
}


pomodoro()
{
    local msg_start='Start Session: What are you going to do?'
    local msg_break='Break time: What did you do?'
    while :
    do
        notify-send 'Pomodoro' "${msg_start}" && \
            echo "${msg_start}: $(date)" && \
            sleep 25m && \
            notify-send 'Pomodoro' "${msg_break}" && \
            echo "${msg_break}: $(date)" && \
            sleep 5m
    done
}


__echo_bold ()
{
    echo "$(tput bold)${*}$(tput sgr0)"
}


__find_hg_repo()
{
    path=$1
    while [ ${path} != '/' ]
    do
        if [ -d "${path}/.hg" ]; then
            echo ${path}
            return 0
        fi
        path=$(readlink -f "${path}/../")
    done

    return 1
}


__restart_ime_ibus ()
{
    set -x
    kill $(ps -Cmozc_server --no-headers -opid) && ibus-daemon -rdx
    set +x
}


__format_sql ()
{
    [ -f '/usr/local/bin/sqlformat' ] || return 1

    local fmt='/usr/local/bin/sqlformat -rk upper  -'

    if [ -n "$*" ]; then
        echo $* | ${fmt}
    else
        ${fmt}
    fi
}


alias rst=__repo_st
alias rdf=__repo_diff
alias rco=__repo_checkout
alias rbr=__repo_branches
alias rft=__repo_fetch
alias rfe=__repo_fetch
alias 'restart-ime'=__restart_ime_ibus
alias format-sql=__format_sql
alias fmt-sql=__format_sql
