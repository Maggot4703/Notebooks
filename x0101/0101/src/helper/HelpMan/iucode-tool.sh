#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iucode-tool.txt
which iucode-tool >>./HelpMan/iucode-tool.txt
whatis iucode-tool >>./HelpMan/iucode-tool.txt
iucode-tool --help >>./HelpMan/iucode-tool.txt
man iucode-tool >>./HelpMan/iucode-tool.txt
