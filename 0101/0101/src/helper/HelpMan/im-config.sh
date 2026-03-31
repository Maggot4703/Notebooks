#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/im-config.txt
which im-config >>./HelpMan/im-config.txt
whatis im-config >>./HelpMan/im-config.txt
im-config --help >>./HelpMan/im-config.txt
man im-config >>./HelpMan/im-config.txt
