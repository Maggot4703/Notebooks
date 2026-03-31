#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/net.txt
which net >>./HelpMan/net.txt
whatis net >>./HelpMan/net.txt
net --help >>./HelpMan/net.txt
man net >>./HelpMan/net.txt
