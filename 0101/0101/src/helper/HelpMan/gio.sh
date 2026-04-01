#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gio.txt
which gio >>./HelpMan/gio.txt
whatis gio >>./HelpMan/gio.txt
gio --help >>./HelpMan/gio.txt
man gio >>./HelpMan/gio.txt
