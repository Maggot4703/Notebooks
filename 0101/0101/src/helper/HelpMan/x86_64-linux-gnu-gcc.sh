#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-gcc.txt
which x86_64-linux-gnu-gcc >>./HelpMan/x86_64-linux-gnu-gcc.txt
whatis x86_64-linux-gnu-gcc >>./HelpMan/x86_64-linux-gnu-gcc.txt
x86_64-linux-gnu-gcc --help >>./HelpMan/x86_64-linux-gnu-gcc.txt
man x86_64-linux-gnu-gcc >>./HelpMan/x86_64-linux-gnu-gcc.txt
