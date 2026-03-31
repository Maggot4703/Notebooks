#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pasteurize.txt
which pasteurize >>./HelpMan/pasteurize.txt
whatis pasteurize >>./HelpMan/pasteurize.txt
pasteurize --help >>./HelpMan/pasteurize.txt
man pasteurize >>./HelpMan/pasteurize.txt
