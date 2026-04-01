#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/snapfuse.txt
which snapfuse >>./HelpMan/snapfuse.txt
whatis snapfuse >>./HelpMan/snapfuse.txt
snapfuse --help >>./HelpMan/snapfuse.txt
man snapfuse >>./HelpMan/snapfuse.txt
