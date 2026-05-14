#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xzfgrep.txt
which xzfgrep >>./HelpMan/xzfgrep.txt
whatis xzfgrep >>./HelpMan/xzfgrep.txt
xzfgrep --help >>./HelpMan/xzfgrep.txt
man xzfgrep >>./HelpMan/xzfgrep.txt
