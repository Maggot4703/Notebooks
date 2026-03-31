#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gamemoderun.txt
which gamemoderun >>./HelpMan/gamemoderun.txt
whatis gamemoderun >>./HelpMan/gamemoderun.txt
gamemoderun --help >>./HelpMan/gamemoderun.txt
man gamemoderun >>./HelpMan/gamemoderun.txt
