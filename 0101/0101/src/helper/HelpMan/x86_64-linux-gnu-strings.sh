#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-strings.txt
which x86_64-linux-gnu-strings >>./HelpMan/x86_64-linux-gnu-strings.txt
whatis x86_64-linux-gnu-strings >>./HelpMan/x86_64-linux-gnu-strings.txt
x86_64-linux-gnu-strings --help >>./HelpMan/x86_64-linux-gnu-strings.txt
man x86_64-linux-gnu-strings >>./HelpMan/x86_64-linux-gnu-strings.txt
