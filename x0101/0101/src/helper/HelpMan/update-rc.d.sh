#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-rc.d.txt
which update-rc.d >>./HelpMan/update-rc.d.txt
whatis update-rc.d >>./HelpMan/update-rc.d.txt
update-rc.d --help >>./HelpMan/update-rc.d.txt
man update-rc.d >>./HelpMan/update-rc.d.txt
