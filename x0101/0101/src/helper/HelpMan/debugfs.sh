#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/debugfs.txt
which debugfs >>./HelpMan/debugfs.txt
whatis debugfs >>./HelpMan/debugfs.txt
debugfs --help >>./HelpMan/debugfs.txt
man debugfs >>./HelpMan/debugfs.txt
