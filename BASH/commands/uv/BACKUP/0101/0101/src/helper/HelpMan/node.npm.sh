#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/node.npm.txt
which node.npm >>./HelpMan/node.npm.txt
whatis node.npm >>./HelpMan/node.npm.txt
node.npm --help >>./HelpMan/node.npm.txt
man node.npm >>./HelpMan/node.npm.txt
