#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ftp.txt
which ftp >>./HelpMan/ftp.txt
whatis ftp >>./HelpMan/ftp.txt
ftp --help >>./HelpMan/ftp.txt
man ftp >>./HelpMan/ftp.txt
