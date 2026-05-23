#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ktelnetservice5.txt
which ktelnetservice5 >>./HelpMan/ktelnetservice5.txt
whatis ktelnetservice5 >>./HelpMan/ktelnetservice5.txt
ktelnetservice5 --help >>./HelpMan/ktelnetservice5.txt
man ktelnetservice5 >>./HelpMan/ktelnetservice5.txt
