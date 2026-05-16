#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xstdcmap.txt
which xstdcmap >>./HelpMan/xstdcmap.txt
whatis xstdcmap >>./HelpMan/xstdcmap.txt
xstdcmap --help >>./HelpMan/xstdcmap.txt
man xstdcmap >>./HelpMan/xstdcmap.txt
