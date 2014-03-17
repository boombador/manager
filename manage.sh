#!/usr/bin/env bash

# ~/.manager/
# ~/.manager/system/* " setup options specific to hostname
# ~/.manager/projects/* " project specific aliases, tmux setup, env variables

# no parameter
    # list active project

PROJECT=$1

# kind of a hacky check
if $(ps -e | grep -q tmux) ; then
    CURPROJECT=`tmux display-message -p "#S"`
fi

if [ -z $PROJECT ] ; then
    if [ -n $CURPROJECT ] ; then
        echo "Current project:" $CURPROJECT
        exit 0
    else
        echo "Manager not active"
        exit 0
    fi
fi

case $PROJECT in
    "manager" ) PROJDIR=~/dev/manager ;; 
    * ) exit 0 ;;
esac

echo "setting up tmux..."

tmux new-session -d -s $PROJECT -c $PROJDIR
tmux send-keys "vim" C-m
tmux split-window -v
tmux attach-session -t $PROJECT
