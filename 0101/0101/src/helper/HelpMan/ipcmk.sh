#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ipcmk.txt
which ipcmk >>./HelpMan/ipcmk.txt
whatis ipcmk >>./HelpMan/ipcmk.txt
ipcmk --help >>./HelpMan/ipcmk.txt
man ipcmk >>./HelpMan/ipcmk.txt
