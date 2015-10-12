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
