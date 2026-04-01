#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2qpdl-wrapper.txt
which foo2qpdl-wrapper >>./HelpMan/foo2qpdl-wrapper.txt
whatis foo2qpdl-wrapper >>./HelpMan/foo2qpdl-wrapper.txt
foo2qpdl-wrapper --help >>./HelpMan/foo2qpdl-wrapper.txt
man foo2qpdl-wrapper >>./HelpMan/foo2qpdl-wrapper.txt
