#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/p11-kit.txt
which p11-kit >>./HelpMan/p11-kit.txt
whatis p11-kit >>./HelpMan/p11-kit.txt
p11-kit --help >>./HelpMan/p11-kit.txt
man p11-kit >>./HelpMan/p11-kit.txt
