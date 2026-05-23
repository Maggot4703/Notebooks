#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2oak-wrapper.txt
which foo2oak-wrapper >>./HelpMan/foo2oak-wrapper.txt
whatis foo2oak-wrapper >>./HelpMan/foo2oak-wrapper.txt
foo2oak-wrapper --help >>./HelpMan/foo2oak-wrapper.txt
man foo2oak-wrapper >>./HelpMan/foo2oak-wrapper.txt
