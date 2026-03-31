#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/unix_update.txt
which unix_update >>./HelpMan/unix_update.txt
whatis unix_update >>./HelpMan/unix_update.txt
unix_update --help >>./HelpMan/unix_update.txt
man unix_update >>./HelpMan/unix_update.txt
