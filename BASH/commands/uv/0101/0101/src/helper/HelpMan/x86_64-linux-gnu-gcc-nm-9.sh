#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-gcc-nm-9.txt
which x86_64-linux-gnu-gcc-nm-9 >>./HelpMan/x86_64-linux-gnu-gcc-nm-9.txt
whatis x86_64-linux-gnu-gcc-nm-9 >>./HelpMan/x86_64-linux-gnu-gcc-nm-9.txt
x86_64-linux-gnu-gcc-nm-9 --help >>./HelpMan/x86_64-linux-gnu-gcc-nm-9.txt
man x86_64-linux-gnu-gcc-nm-9 >>./HelpMan/x86_64-linux-gnu-gcc-nm-9.txt
