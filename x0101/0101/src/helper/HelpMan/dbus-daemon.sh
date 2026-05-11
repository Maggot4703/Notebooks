#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dbus-daemon.txt
which dbus-daemon >>./HelpMan/dbus-daemon.txt
whatis dbus-daemon >>./HelpMan/dbus-daemon.txt
dbus-daemon --help >>./HelpMan/dbus-daemon.txt
man dbus-daemon >>./HelpMan/dbus-daemon.txt
