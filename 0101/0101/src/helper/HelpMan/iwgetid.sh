#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iwgetid.txt
which iwgetid >>./HelpMan/iwgetid.txt
whatis iwgetid >>./HelpMan/iwgetid.txt
iwgetid --help >>./HelpMan/iwgetid.txt
man iwgetid >>./HelpMan/iwgetid.txt
