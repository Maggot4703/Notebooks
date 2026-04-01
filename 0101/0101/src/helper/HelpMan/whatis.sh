#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/whatis.txt
which whatis >>./HelpMan/whatis.txt
whatis whatis >>./HelpMan/whatis.txt
whatis --help >>./HelpMan/whatis.txt
man whatis >>./HelpMan/whatis.txt
