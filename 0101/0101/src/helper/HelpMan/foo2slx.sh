#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2slx.txt
which foo2slx >>./HelpMan/foo2slx.txt
whatis foo2slx >>./HelpMan/foo2slx.txt
foo2slx --help >>./HelpMan/foo2slx.txt
man foo2slx >>./HelpMan/foo2slx.txt
