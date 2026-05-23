#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/coproc.txt
which coproc >>./HelpMan/coproc.txt
whatis coproc >>./HelpMan/coproc.txt
coproc --help >>./HelpMan/coproc.txt
man coproc >>./HelpMan/coproc.txt
