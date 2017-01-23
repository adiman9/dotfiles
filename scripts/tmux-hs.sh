#!/bin/sh
#
# Setup a work space called `work` with two windows
# first window has 3 panes. 
# The first pane set at 65%, split horizontally, set to api root and running vim
# pane 2 is split at 25% and running redis-server 
# pane 3 is set to api root and bash prompt.
# note: `api` aliased to `cd ~/path/to/work`
#
session="hs"

# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s hs -n vim #"vim -S ~/.vim/sessions/hssession"

tmux send-keys 'cd ~/headspinio/web/' C-m
tmux splitw -v -p 25 -t hs
tmux selectp -t 1
tmux splitw -h -p 50 -t hs
tmux new-window -t hs:1 -n server
tmux selectp -t hs:1
tmux send-keys 'hsenv local && cd ~/headspinio/platform/headspin/ && vim' C-m
tmux splitw -v -p 25 -t hs
tmux selectp -t 1
tmux send-keys 'cd ~/headspinio/platform/headspin/' C-m
tmux splitw -h -p 50 -t hs
tmux selectp -t 2
tmux send-keys 'cd ~/headspinio/platform/headspin/' C-m
tmux select-window -t 0
tmux send-keys 'cd ~/headspinio/web/ && serve-websites' C-m
tmux selectp -t 0
tmux send-keys 'vim' C-m

# Finished setup, attach to the tmux session!
tmux attach-session -t hs
