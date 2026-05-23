#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/node-red.npm.txt
which node-red.npm >>./HelpMan/node-red.npm.txt
whatis node-red.npm >>./HelpMan/node-red.npm.txt
node-red.npm --help >>./HelpMan/node-red.npm.txt
man node-red.npm >>./HelpMan/node-red.npm.txt
