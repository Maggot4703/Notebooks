#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fstrim.txt
which fstrim >>./HelpMan/fstrim.txt
whatis fstrim >>./HelpMan/fstrim.txt
fstrim --help >>./HelpMan/fstrim.txt
man fstrim >>./HelpMan/fstrim.txt
