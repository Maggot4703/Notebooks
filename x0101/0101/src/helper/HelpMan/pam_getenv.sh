#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pam_getenv.txt
which pam_getenv >>./HelpMan/pam_getenv.txt
whatis pam_getenv >>./HelpMan/pam_getenv.txt
pam_getenv --help >>./HelpMan/pam_getenv.txt
man pam_getenv >>./HelpMan/pam_getenv.txt
