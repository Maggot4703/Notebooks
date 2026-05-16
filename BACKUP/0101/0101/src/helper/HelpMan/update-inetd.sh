#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-inetd.txt
which update-inetd >>./HelpMan/update-inetd.txt
whatis update-inetd >>./HelpMan/update-inetd.txt
update-inetd --help >>./HelpMan/update-inetd.txt
man update-inetd >>./HelpMan/update-inetd.txt
