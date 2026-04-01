#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mformat.txt
which mformat >>./HelpMan/mformat.txt
whatis mformat >>./HelpMan/mformat.txt
mformat --help >>./HelpMan/mformat.txt
man mformat >>./HelpMan/mformat.txt
