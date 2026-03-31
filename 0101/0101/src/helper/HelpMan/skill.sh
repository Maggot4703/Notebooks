#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/skill.txt
which skill >>./HelpMan/skill.txt
whatis skill >>./HelpMan/skill.txt
skill --help >>./HelpMan/skill.txt
man skill >>./HelpMan/skill.txt
