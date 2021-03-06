#!/bin/bash

# Selected options for "emacsclient"
#
# -c          Create a new frame instead of trying to use the current
#             Emacs frame.
#
# -e          Evaluate the FILE arguments as ELisp expressions.
#
# -n          Don't wait for the server to return.
#
# -t          Open a new Emacs frame on the current terminal.
#
# Note that the "-t" and "-n" options are contradictory: "-t" says to
# take control of the current text terminal to create a new client frame,
# while "-n" says not to take control of the text terminal.  If you
# supply both options, Emacs visits the specified files(s) in an existing
# frame rather than a new client frame, negating the effect of "-t".

# check whether an Emacs server is already running
pgrep -l "^emacs$" > /dev/null

# otherwise, start Emacs server daemon
if [ $? -ne 0 ]; then
    emacs --daemon
fi

emacsclient -n -c "$@"

#####################################################################
# # return a list of all frames on $DISPLAY													 #
# emacsclient -e "(frames-on-display-list \"$DISPLAY\")" &>/dev/null #
# 																																	 #
# # open frames detected, so open files in current frame						 #
# if [ $? -eq 0 ]; then																							 #
#     emacsclient -n -t "$@"																				 #
# # no open frames detected, so open new frame											 #
# else																															 #
#     emacsclient -n -c "$@"																				 #
# fi																																 #
######################################################################
