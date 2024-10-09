OK="2714"
OVERDUE=" "
DUETODAY=" "
DUETOMORROW=" "
URGENT=" "

function task_indicator {
    if [ `task +READY +OVERDUE count` -gt "0" ]  ; then
        printf "%b" "\u$OVERDUE"
    elif [ `task +READY +DUETODAY count` -gt "0" ]  ; then
        printf "%b" "\u$DUETODAY"
    elif [ `task +READY +DUETomorrow count` -gt "0" ]  ; then
        printf "%b" "\u$DUETOMORROW"
    elif [ `task +READY urgency \> 5 count` -gt "0" ]  ; then
        printf "%b" "\u$URGENT"
    else
        printf "%b" "\u$OK"
    fi
}

function tedue() {
    # modify due date
    if [[ -z "$1" && -z "$2" ]]; then
       echo "Usage: task \$1 modify due:\$2"
       echo "Please provide: ID and DUE DATE"
       return
    fi
    task $1 modify due:$2
}

function tepro() {
    # modify project
    if [[ -z "$1" && -z "$2" ]]; then
       echo "Usage: task \$1 modify project:\$2"
       echo "Please provide: ID and PROJECT"
       return
    fi
    task $1 modify project:$2
}

function tet() {
    # modify tag
    if [[ -z "$1" && -z "$2" ]]; then
       echo "Usage: task \$1 modify +\$2"
       echo "Please provide: ID and TAG"
       return
    fi
    task $1 modify +$2
}

