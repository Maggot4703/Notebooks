#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-gold.txt
which x86_64-linux-gnu-gold >>./HelpMan/x86_64-linux-gnu-gold.txt
whatis x86_64-linux-gnu-gold >>./HelpMan/x86_64-linux-gnu-gold.txt
x86_64-linux-gnu-gold --help >>./HelpMan/x86_64-linux-gnu-gold.txt
man x86_64-linux-gnu-gold >>./HelpMan/x86_64-linux-gnu-gold.txt
