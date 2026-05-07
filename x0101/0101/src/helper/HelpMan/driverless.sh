#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/driverless.txt
which driverless >>./HelpMan/driverless.txt
whatis driverless >>./HelpMan/driverless.txt
driverless --help >>./HelpMan/driverless.txt
man driverless >>./HelpMan/driverless.txt
