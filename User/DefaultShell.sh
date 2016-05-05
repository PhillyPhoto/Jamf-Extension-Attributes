#!/bin/bash

#####################################################################################################
#
# ABOUT THIS PROGRAM
#
# NAME
#   DefaultShell.sh -- Installs or updates Adobe Flash Player
#
# SYNOPSIS
#   sudo DefaultShell.sh
#
# LICENSE
#   Distributed under the MIT License
#
####################################################################################################
#
# HISTORY
#
#   Version: 1.0
#
#   - v.1.0 Luis Lugo, 03.05.2016 : Check the default shell is /bin/bash, if not - change it
#
####################################################################################################

#  Set the shell here
defShell="/bin/bash"

#  Check if the shell is set correctly
if [[ `/usr/libexec/PlistBuddy -c "Print :Shell" ~/Library/Preferences/com.apple.terminal.plist` != "$defShell" ]]
then
    #  The shell was not set correctly, change it to the correct one
    `/usr/libexec/PlistBuddy -c "Set :Shell $defShell" ~/Library/Preferences/com.apple.terminal.plist`
    #  Check shell again
    result=`/usr/libexec/PlistBuddy -c "Print :Shell" ~/Library/Preferences/com.apple.terminal.plist`
    #  Echo the result of the shell after changing it
    echo "<result>$result</result>"
else
    #  The shell matches, echo it out
    echo "<result>$defShell</result>"
fi
