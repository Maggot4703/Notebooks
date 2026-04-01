#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2qpdl.txt
which foo2qpdl >>./HelpMan/foo2qpdl.txt
whatis foo2qpdl >>./HelpMan/foo2qpdl.txt
foo2qpdl --help >>./HelpMan/foo2qpdl.txt
man foo2qpdl >>./HelpMan/foo2qpdl.txt
