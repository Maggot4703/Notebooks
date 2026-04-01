#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/perlthanks.txt
which perlthanks >>./HelpMan/perlthanks.txt
whatis perlthanks >>./HelpMan/perlthanks.txt
perlthanks --help >>./HelpMan/perlthanks.txt
man perlthanks >>./HelpMan/perlthanks.txt
