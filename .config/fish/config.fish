# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# This file is run by all fish instances.
# To include configuration only for login shells, use
# if status --is-login
#    ...
# end
# To include configuration only for interactive shells, use
# if status --is-interactive
#   ...
# end
#
#
#
#
#
#
##PATH
set -gx PATH /home/yuri/.scripts/ $PATH

##ANDROID
set -x ANDROID_HOME ~/Android/

set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/cmdline-tools $PATH
set -gx PATH $ANDROID_HOME/cmdline-tools/tools/bin $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH
#-------

##EDITOR
set -x EDITOR nvim
