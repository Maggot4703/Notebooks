#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2hbpl2-wrapper.txt
which foo2hbpl2-wrapper >>./HelpMan/foo2hbpl2-wrapper.txt
whatis foo2hbpl2-wrapper >>./HelpMan/foo2hbpl2-wrapper.txt
foo2hbpl2-wrapper --help >>./HelpMan/foo2hbpl2-wrapper.txt
man foo2hbpl2-wrapper >>./HelpMan/foo2hbpl2-wrapper.txt
