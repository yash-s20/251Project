#!/bin/bash

server="set_url"
config="config_edit"
observe="observe"
sync="sync"
daemon="stop_daemon"
setkey="set_key"
version_req="version"
version="version 1.01"
status="status"
help="help"

changekey="en_de_update"
keys="en_de_list"
dump="dump"

server_stat="server"


#cd $SPC_PATH

if [ "$1" == "$server" ]
then
    python3.7 startup.py set_server "$2"
elif [ "$1" == "$keys" ]
then
    echo 1. AES
    echo 2. TripleDES
    echo 3. RC4
elif [ "$1" == "$config" ]
then
    python3.7 startup.py config
elif [ "$1" == "$observe" ]
then
    python3.7 startup.py observe "$2"
elif [ "$1" == "$version_req" ]
then
    echo "$version"
elif [ "$1" == "$help" ]
then
    echo config_edit - configure your username and password for easier access
    echo set_url [URL] - set the url for your server
    echo observe [HOME_DIR] - set the directorly to be monitored
    echo sync - synchronise local and cloud copy. They are identical after this command
    echo See man page for further information
elif [ "$1" == "$sync" ]
then
    python3.7 startup.py sync
elif [ "$1" == "$daemon" ]
then
    pid=$(ps -aux | grep "daemon.py$" | sed 's/\s\+/ /g' | cut -d' ' -f2)
    sudo kill -9 $pid
    echo Daemon Terminated
elif [ "$1" == "$setkey" ]
then
    python3.7 startup.py generate_key
elif [ "$1" == "$changekey" ]
then
    if [ "$#" -ne 1 ]
    then
        python3.7 startup.py change_file "$2"
    else
        python3.7 startup.py change_key
    fi
elif [ "$1" == "$dump" ]
then
if [ "$#" -ne 1 ]
    then
        python3.7 startup.py store_key_file "$2"
    else
        python3.7 startup.py store_key
    fi
elif [ "$1" == "print_key" ]
then
    python3.7 startup.py print_key
elif [ "$1" == "$status" ]
then
    python3.7 startup.py status
elif [ "$1" == "$server_stat" ]
then
    python3.7 startup.py server
else
    echo "spc $1 -- command not found. For help look at the man page"
fi

#cd - > /dev/null
