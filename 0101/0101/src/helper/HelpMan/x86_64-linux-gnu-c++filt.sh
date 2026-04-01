#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-c++filt.txt
which x86_64-linux-gnu-c++filt >>./HelpMan/x86_64-linux-gnu-c++filt.txt
whatis x86_64-linux-gnu-c++filt >>./HelpMan/x86_64-linux-gnu-c++filt.txt
x86_64-linux-gnu-c++filt --help >>./HelpMan/x86_64-linux-gnu-c++filt.txt
man x86_64-linux-gnu-c++filt >>./HelpMan/x86_64-linux-gnu-c++filt.txt
