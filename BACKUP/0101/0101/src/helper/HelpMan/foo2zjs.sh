#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2zjs.txt
which foo2zjs >>./HelpMan/foo2zjs.txt
whatis foo2zjs >>./HelpMan/foo2zjs.txt
foo2zjs --help >>./HelpMan/foo2zjs.txt
man foo2zjs >>./HelpMan/foo2zjs.txt
