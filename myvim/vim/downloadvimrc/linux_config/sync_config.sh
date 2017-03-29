function batch_sync_profile()
{
    # tar the private setting.
    tar czvf profile.tar.gz .bash_profile .bash_svn_completion .vimrc .ssh .dir_colors .xtail >/dev/null

    sync_profile $1

    rm profile.tar.gz
}

# sync a group of machines.
function group_sync_profile()
{
    hostPrefix=$1
    hostMin=$2
    hostMax=$3
    hostPostfix=$4

    for((i=${hostMin}; i<=${hostMax}; i++)); do
        local host=${hostPrefix}${i}${hostPostfix}
        sync_profile $host
    done    
}

# sync one machine.
function sync_profile()
{
    host=$1
    echo $host
    scp profile.tar.gz $host:~/
    ssh $host tar zxvf ~/profile.tar.gz >/dev/null
    ssh $host rm ~/profile.tar.gz
    echo
}
