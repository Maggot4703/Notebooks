#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2hiperc-wrapper.txt
which foo2hiperc-wrapper >>./HelpMan/foo2hiperc-wrapper.txt
whatis foo2hiperc-wrapper >>./HelpMan/foo2hiperc-wrapper.txt
foo2hiperc-wrapper --help >>./HelpMan/foo2hiperc-wrapper.txt
man foo2hiperc-wrapper >>./HelpMan/foo2hiperc-wrapper.txt
