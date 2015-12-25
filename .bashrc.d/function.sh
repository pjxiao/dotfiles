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
        echo 'Git'
        git diff
        return
    fi

    if [ -n "$(__hg_branch)" ]; then
        echo 'Mercurial'
        hg diff
        return
    fi
}


__repo_st()
{
    if [ -n "$(__git_branch)" ]; then
        echo 'Git'
        git status
        return
    fi

    if [ -n "$(__hg_branch)" ]; then
        echo 'Mercurial'
        hg status
        return
    fi
}


alias rst=__repo_st
alias rdf=__repo_diff
