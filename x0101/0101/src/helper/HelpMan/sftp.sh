#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sftp.txt
which sftp >>./HelpMan/sftp.txt
whatis sftp >>./HelpMan/sftp.txt
sftp --help >>./HelpMan/sftp.txt
man sftp >>./HelpMan/sftp.txt
