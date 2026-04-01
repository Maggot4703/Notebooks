#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-ld.txt
which x86_64-linux-gnu-ld >>./HelpMan/x86_64-linux-gnu-ld.txt
whatis x86_64-linux-gnu-ld >>./HelpMan/x86_64-linux-gnu-ld.txt
x86_64-linux-gnu-ld --help >>./HelpMan/x86_64-linux-gnu-ld.txt
man x86_64-linux-gnu-ld >>./HelpMan/x86_64-linux-gnu-ld.txt
