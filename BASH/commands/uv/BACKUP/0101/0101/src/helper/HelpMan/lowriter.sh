#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lowriter.txt
which lowriter >>./HelpMan/lowriter.txt
whatis lowriter >>./HelpMan/lowriter.txt
lowriter --help >>./HelpMan/lowriter.txt
man lowriter >>./HelpMan/lowriter.txt
