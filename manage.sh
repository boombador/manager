#!/usr/bin/env bash
# must be called as `. manage.sh`, probably good to alias

# this script will detect the passed project name and set up the environment for working on it
# this script should set up tmux sessions, windows, panes
# separate driver script attaches you to your tmux session for the project
# should store this project setup script in ~/.manager/

# ~/.manager/
# ~/.manager/system/* " setup options specific to hostname
# ~/.manager/projects/* " project specific aliases, tmux setup, env variables

# simple system to get started
PROJECT=$1
case $PROJECT in
    "manager" )
        PROJDIR=~/dev/manager
        cd $PROJDIR
        echo "Beginning work on " $PROJECT
        echo "Entering " $PROJDIR
        tmux new -s $PROJECT
        tmux split-window -v
        tmux new-window -t $PROJECT:1 -n 'vim'
esac

