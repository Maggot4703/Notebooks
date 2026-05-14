#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/node.npx.txt
which node.npx >>./HelpMan/node.npx.txt
whatis node.npx >>./HelpMan/node.npx.txt
node.npx --help >>./HelpMan/node.npx.txt
man node.npx >>./HelpMan/node.npx.txt
