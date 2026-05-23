#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/catchsegv.txt
which catchsegv >>./HelpMan/catchsegv.txt
whatis catchsegv >>./HelpMan/catchsegv.txt
catchsegv --help >>./HelpMan/catchsegv.txt
man catchsegv >>./HelpMan/catchsegv.txt
