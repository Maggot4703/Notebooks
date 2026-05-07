#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-dwp.txt
which x86_64-linux-gnu-dwp >>./HelpMan/x86_64-linux-gnu-dwp.txt
whatis x86_64-linux-gnu-dwp >>./HelpMan/x86_64-linux-gnu-dwp.txt
x86_64-linux-gnu-dwp --help >>./HelpMan/x86_64-linux-gnu-dwp.txt
man x86_64-linux-gnu-dwp >>./HelpMan/x86_64-linux-gnu-dwp.txt
