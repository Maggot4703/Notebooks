#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-objdump.txt
which x86_64-linux-gnu-objdump >>./HelpMan/x86_64-linux-gnu-objdump.txt
whatis x86_64-linux-gnu-objdump >>./HelpMan/x86_64-linux-gnu-objdump.txt
x86_64-linux-gnu-objdump --help >>./HelpMan/x86_64-linux-gnu-objdump.txt
man x86_64-linux-gnu-objdump >>./HelpMan/x86_64-linux-gnu-objdump.txt
