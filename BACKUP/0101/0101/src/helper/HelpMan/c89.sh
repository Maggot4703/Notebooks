#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/c89.txt
which c89 >>./HelpMan/c89.txt
whatis c89 >>./HelpMan/c89.txt
c89 --help >>./HelpMan/c89.txt
man c89 >>./HelpMan/c89.txt
