#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-size.txt
which x86_64-linux-gnu-size >>./HelpMan/x86_64-linux-gnu-size.txt
whatis x86_64-linux-gnu-size >>./HelpMan/x86_64-linux-gnu-size.txt
x86_64-linux-gnu-size --help >>./HelpMan/x86_64-linux-gnu-size.txt
man x86_64-linux-gnu-size >>./HelpMan/x86_64-linux-gnu-size.txt
