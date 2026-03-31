#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/peekfd.txt
which peekfd >>./HelpMan/peekfd.txt
whatis peekfd >>./HelpMan/peekfd.txt
peekfd --help >>./HelpMan/peekfd.txt
man peekfd >>./HelpMan/peekfd.txt
