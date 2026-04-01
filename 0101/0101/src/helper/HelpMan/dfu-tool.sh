#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dfu-tool.txt
which dfu-tool >>./HelpMan/dfu-tool.txt
whatis dfu-tool >>./HelpMan/dfu-tool.txt
dfu-tool --help >>./HelpMan/dfu-tool.txt
man dfu-tool >>./HelpMan/dfu-tool.txt
