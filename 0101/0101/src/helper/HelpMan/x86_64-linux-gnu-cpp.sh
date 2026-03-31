#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-cpp.txt
which x86_64-linux-gnu-cpp >>./HelpMan/x86_64-linux-gnu-cpp.txt
whatis x86_64-linux-gnu-cpp >>./HelpMan/x86_64-linux-gnu-cpp.txt
x86_64-linux-gnu-cpp --help >>./HelpMan/x86_64-linux-gnu-cpp.txt
man x86_64-linux-gnu-cpp >>./HelpMan/x86_64-linux-gnu-cpp.txt
