#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2slx-wrapper.txt
which foo2slx-wrapper >>./HelpMan/foo2slx-wrapper.txt
whatis foo2slx-wrapper >>./HelpMan/foo2slx-wrapper.txt
foo2slx-wrapper --help >>./HelpMan/foo2slx-wrapper.txt
man foo2slx-wrapper >>./HelpMan/foo2slx-wrapper.txt
