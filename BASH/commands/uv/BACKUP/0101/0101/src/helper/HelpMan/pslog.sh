#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pslog.txt
which pslog >>./HelpMan/pslog.txt
whatis pslog >>./HelpMan/pslog.txt
pslog --help >>./HelpMan/pslog.txt
man pslog >>./HelpMan/pslog.txt
