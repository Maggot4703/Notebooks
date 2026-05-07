#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xcursorgen.txt
which xcursorgen >>./HelpMan/xcursorgen.txt
whatis xcursorgen >>./HelpMan/xcursorgen.txt
xcursorgen --help >>./HelpMan/xcursorgen.txt
man xcursorgen >>./HelpMan/xcursorgen.txt
