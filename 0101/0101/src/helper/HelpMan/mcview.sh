#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mcview.txt
which mcview >>./HelpMan/mcview.txt
whatis mcview >>./HelpMan/mcview.txt
mcview --help >>./HelpMan/mcview.txt
man mcview >>./HelpMan/mcview.txt
