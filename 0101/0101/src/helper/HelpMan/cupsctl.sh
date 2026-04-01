#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cupsctl.txt
which cupsctl >>./HelpMan/cupsctl.txt
whatis cupsctl >>./HelpMan/cupsctl.txt
cupsctl --help >>./HelpMan/cupsctl.txt
man cupsctl >>./HelpMan/cupsctl.txt
