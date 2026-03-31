#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mii-tool.txt
which mii-tool >>./HelpMan/mii-tool.txt
whatis mii-tool >>./HelpMan/mii-tool.txt
mii-tool --help >>./HelpMan/mii-tool.txt
man mii-tool >>./HelpMan/mii-tool.txt
