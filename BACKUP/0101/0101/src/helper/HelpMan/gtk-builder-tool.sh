#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gtk-builder-tool.txt
which gtk-builder-tool >>./HelpMan/gtk-builder-tool.txt
whatis gtk-builder-tool >>./HelpMan/gtk-builder-tool.txt
gtk-builder-tool --help >>./HelpMan/gtk-builder-tool.txt
man gtk-builder-tool >>./HelpMan/gtk-builder-tool.txt
