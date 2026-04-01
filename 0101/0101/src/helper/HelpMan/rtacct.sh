#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rtacct.txt
which rtacct >>./HelpMan/rtacct.txt
whatis rtacct >>./HelpMan/rtacct.txt
rtacct --help >>./HelpMan/rtacct.txt
man rtacct >>./HelpMan/rtacct.txt
