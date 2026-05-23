#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/infobrowser.txt
which infobrowser >>./HelpMan/infobrowser.txt
whatis infobrowser >>./HelpMan/infobrowser.txt
infobrowser --help >>./HelpMan/infobrowser.txt
man infobrowser >>./HelpMan/infobrowser.txt
