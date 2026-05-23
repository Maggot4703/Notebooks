#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-nm.txt
which x86_64-linux-gnu-nm >>./HelpMan/x86_64-linux-gnu-nm.txt
whatis x86_64-linux-gnu-nm >>./HelpMan/x86_64-linux-gnu-nm.txt
x86_64-linux-gnu-nm --help >>./HelpMan/x86_64-linux-gnu-nm.txt
man x86_64-linux-gnu-nm >>./HelpMan/x86_64-linux-gnu-nm.txt
