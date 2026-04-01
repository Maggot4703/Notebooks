#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-passwd.txt
which update-passwd >>./HelpMan/update-passwd.txt
whatis update-passwd >>./HelpMan/update-passwd.txt
update-passwd --help >>./HelpMan/update-passwd.txt
man update-passwd >>./HelpMan/update-passwd.txt
