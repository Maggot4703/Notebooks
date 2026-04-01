#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/env.txt
which env >>./HelpMan/env.txt
whatis env >>./HelpMan/env.txt
env --help >>./HelpMan/env.txt
man env >>./HelpMan/env.txt
