#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/logname.txt
which logname >>./HelpMan/logname.txt
whatis logname >>./HelpMan/logname.txt
logname --help >>./HelpMan/logname.txt
man logname >>./HelpMan/logname.txt
