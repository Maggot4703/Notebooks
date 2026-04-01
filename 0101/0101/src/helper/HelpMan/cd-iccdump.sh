#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cd-iccdump.txt
which cd-iccdump >>./HelpMan/cd-iccdump.txt
whatis cd-iccdump >>./HelpMan/cd-iccdump.txt
cd-iccdump --help >>./HelpMan/cd-iccdump.txt
man cd-iccdump >>./HelpMan/cd-iccdump.txt
