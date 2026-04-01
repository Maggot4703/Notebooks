#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-strip.txt
which x86_64-linux-gnu-strip >>./HelpMan/x86_64-linux-gnu-strip.txt
whatis x86_64-linux-gnu-strip >>./HelpMan/x86_64-linux-gnu-strip.txt
x86_64-linux-gnu-strip --help >>./HelpMan/x86_64-linux-gnu-strip.txt
man x86_64-linux-gnu-strip >>./HelpMan/x86_64-linux-gnu-strip.txt
