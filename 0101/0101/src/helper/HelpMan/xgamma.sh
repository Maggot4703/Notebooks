#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xgamma.txt
which xgamma >>./HelpMan/xgamma.txt
whatis xgamma >>./HelpMan/xgamma.txt
xgamma --help >>./HelpMan/xgamma.txt
man xgamma >>./HelpMan/xgamma.txt
