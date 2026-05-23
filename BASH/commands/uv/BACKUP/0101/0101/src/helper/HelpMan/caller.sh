#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/caller.txt
which caller >>./HelpMan/caller.txt
whatis caller >>./HelpMan/caller.txt
caller --help >>./HelpMan/caller.txt
man caller >>./HelpMan/caller.txt
