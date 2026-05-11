#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/objdump.txt
which objdump >>./HelpMan/objdump.txt
whatis objdump >>./HelpMan/objdump.txt
objdump --help >>./HelpMan/objdump.txt
man objdump >>./HelpMan/objdump.txt
