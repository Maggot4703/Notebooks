#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-ar.txt
which x86_64-linux-gnu-ar >>./HelpMan/x86_64-linux-gnu-ar.txt
whatis x86_64-linux-gnu-ar >>./HelpMan/x86_64-linux-gnu-ar.txt
x86_64-linux-gnu-ar --help >>./HelpMan/x86_64-linux-gnu-ar.txt
man x86_64-linux-gnu-ar >>./HelpMan/x86_64-linux-gnu-ar.txt
