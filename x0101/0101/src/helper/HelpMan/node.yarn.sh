#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/node.yarn.txt
which node.yarn >>./HelpMan/node.yarn.txt
whatis node.yarn >>./HelpMan/node.yarn.txt
node.yarn --help >>./HelpMan/node.yarn.txt
man node.yarn >>./HelpMan/node.yarn.txt
