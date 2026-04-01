#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lavadecode.txt
which lavadecode >>./HelpMan/lavadecode.txt
whatis lavadecode >>./HelpMan/lavadecode.txt
lavadecode --help >>./HelpMan/lavadecode.txt
man lavadecode >>./HelpMan/lavadecode.txt
