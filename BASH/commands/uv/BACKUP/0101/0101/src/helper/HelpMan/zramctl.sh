#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/zramctl.txt
which zramctl >>./HelpMan/zramctl.txt
whatis zramctl >>./HelpMan/zramctl.txt
zramctl --help >>./HelpMan/zramctl.txt
man zramctl >>./HelpMan/zramctl.txt
