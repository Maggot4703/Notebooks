#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gtk-query-settings.txt
which gtk-query-settings >>./HelpMan/gtk-query-settings.txt
whatis gtk-query-settings >>./HelpMan/gtk-query-settings.txt
gtk-query-settings --help >>./HelpMan/gtk-query-settings.txt
man gtk-query-settings >>./HelpMan/gtk-query-settings.txt
