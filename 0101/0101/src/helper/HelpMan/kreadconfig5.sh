#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/kreadconfig5.txt
which kreadconfig5 >>./HelpMan/kreadconfig5.txt
whatis kreadconfig5 >>./HelpMan/kreadconfig5.txt
kreadconfig5 --help >>./HelpMan/kreadconfig5.txt
man kreadconfig5 >>./HelpMan/kreadconfig5.txt
