#!/bin/sh
#
# Setup a work space called `work` with two windows
# first window has 3 panes. 
# The first pane set at 65%, split horizontally, set to api root and running vim
# pane 2 is split at 25% and running redis-server 
# pane 3 is set to api root and bash prompt.
# note: `api` aliased to `cd ~/path/to/work`
#
session="work"

# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s dev -n vim #"vim -S ~/.vim/sessions/kittybusiness"

tmux splitw -v -p 25 -t dev
tmux selectp -t 1
tmux splitw -h -p 50 -t dev
tmux selectp -t 1
tmux new-window -t dev:1 -n server
tmux selectp -t dev:1
tmux send-keys 'npm run dev' C-m
tmux select-window -t 0
tmux selectp -t 2
tmux send-keys 'npm test' C-m
tmux selectp -t 0
tmux send-keys 'vim' C-m
tmux selectp -t 1

# Finished setup, attach to the tmux session!
tmux attach-session -t dev
