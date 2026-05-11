#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-ranlib.txt
which x86_64-linux-gnu-ranlib >>./HelpMan/x86_64-linux-gnu-ranlib.txt
whatis x86_64-linux-gnu-ranlib >>./HelpMan/x86_64-linux-gnu-ranlib.txt
x86_64-linux-gnu-ranlib --help >>./HelpMan/x86_64-linux-gnu-ranlib.txt
man x86_64-linux-gnu-ranlib >>./HelpMan/x86_64-linux-gnu-ranlib.txt
