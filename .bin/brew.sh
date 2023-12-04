#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# if you use "mas" command in .Brewfile, add below script.
# function login_check {
#   sleep 1; echo "Open the App Store." && open -a App\ Store
#   while true; do
#     echo -n "$* [Y/n]: (default: n) "
#     read ANS
#     case $ANS in
#       [Yy]*)
#         return 0
#         ;;
#       *)
#         open_app_store
#         ;;
#     esac
#   done
# }
#
# if login_check "Did you login?"; then
#   brew bundle --global
# fi

brew bundle --global