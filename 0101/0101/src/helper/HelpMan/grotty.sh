#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grotty.txt
which grotty >>./HelpMan/grotty.txt
whatis grotty >>./HelpMan/grotty.txt
grotty --help >>./HelpMan/grotty.txt
man grotty >>./HelpMan/grotty.txt
