#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pinky.txt
which pinky >>./HelpMan/pinky.txt
whatis pinky >>./HelpMan/pinky.txt
pinky --help >>./HelpMan/pinky.txt
man pinky >>./HelpMan/pinky.txt
