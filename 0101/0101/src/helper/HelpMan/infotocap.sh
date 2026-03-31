#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/infotocap.txt
which infotocap >>./HelpMan/infotocap.txt
whatis infotocap >>./HelpMan/infotocap.txt
infotocap --help >>./HelpMan/infotocap.txt
man infotocap >>./HelpMan/infotocap.txt
