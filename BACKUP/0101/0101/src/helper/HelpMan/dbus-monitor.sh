#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dbus-monitor.txt
which dbus-monitor >>./HelpMan/dbus-monitor.txt
whatis dbus-monitor >>./HelpMan/dbus-monitor.txt
dbus-monitor --help >>./HelpMan/dbus-monitor.txt
man dbus-monitor >>./HelpMan/dbus-monitor.txt
