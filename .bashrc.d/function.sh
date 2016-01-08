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
        git status
        return
    fi

    if [ -n "$(__hg_branch)" ]; then
        __echo_bold 'Mercurial'
        hg status
        return
    fi
}

pomodoro()
{
    local msg_start='Start Session'
    local msg_break='Break time'
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


alias rst=__repo_st
alias rdf=__repo_diff
