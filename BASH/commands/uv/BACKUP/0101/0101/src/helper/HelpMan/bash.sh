#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bash.txt
which bash >>./HelpMan/bash.txt
whatis bash >>./HelpMan/bash.txt
bash --help >>./HelpMan/bash.txt
man bash >>./HelpMan/bash.txt
