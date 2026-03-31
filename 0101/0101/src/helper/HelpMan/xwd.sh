#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xwd.txt
which xwd >>./HelpMan/xwd.txt
whatis xwd >>./HelpMan/xwd.txt
xwd --help >>./HelpMan/xwd.txt
man xwd >>./HelpMan/xwd.txt
