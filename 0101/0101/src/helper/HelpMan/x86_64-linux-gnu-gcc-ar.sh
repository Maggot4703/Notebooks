#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-gcc-ar.txt
which x86_64-linux-gnu-gcc-ar >>./HelpMan/x86_64-linux-gnu-gcc-ar.txt
whatis x86_64-linux-gnu-gcc-ar >>./HelpMan/x86_64-linux-gnu-gcc-ar.txt
x86_64-linux-gnu-gcc-ar --help >>./HelpMan/x86_64-linux-gnu-gcc-ar.txt
man x86_64-linux-gnu-gcc-ar >>./HelpMan/x86_64-linux-gnu-gcc-ar.txt
