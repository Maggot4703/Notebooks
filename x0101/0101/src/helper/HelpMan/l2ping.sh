#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/l2ping.txt
which l2ping >>./HelpMan/l2ping.txt
whatis l2ping >>./HelpMan/l2ping.txt
l2ping --help >>./HelpMan/l2ping.txt
man l2ping >>./HelpMan/l2ping.txt
