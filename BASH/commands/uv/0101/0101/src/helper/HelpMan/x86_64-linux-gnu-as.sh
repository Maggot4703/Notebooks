#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-as.txt
which x86_64-linux-gnu-as >>./HelpMan/x86_64-linux-gnu-as.txt
whatis x86_64-linux-gnu-as >>./HelpMan/x86_64-linux-gnu-as.txt
x86_64-linux-gnu-as --help >>./HelpMan/x86_64-linux-gnu-as.txt
man x86_64-linux-gnu-as >>./HelpMan/x86_64-linux-gnu-as.txt
