#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cd-create-profile.txt
which cd-create-profile >>./HelpMan/cd-create-profile.txt
whatis cd-create-profile >>./HelpMan/cd-create-profile.txt
cd-create-profile --help >>./HelpMan/cd-create-profile.txt
man cd-create-profile >>./HelpMan/cd-create-profile.txt
