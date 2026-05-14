#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mimeopen.txt
which mimeopen >>./HelpMan/mimeopen.txt
whatis mimeopen >>./HelpMan/mimeopen.txt
mimeopen --help >>./HelpMan/mimeopen.txt
man mimeopen >>./HelpMan/mimeopen.txt
