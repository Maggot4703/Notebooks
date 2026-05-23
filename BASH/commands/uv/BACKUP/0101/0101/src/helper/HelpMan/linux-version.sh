#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/linux-version.txt
which linux-version >>./HelpMan/linux-version.txt
whatis linux-version >>./HelpMan/linux-version.txt
linux-version --help >>./HelpMan/linux-version.txt
man linux-version >>./HelpMan/linux-version.txt
