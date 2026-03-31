#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dbus-update-activation-environment.txt
which dbus-update-activation-environment >>./HelpMan/dbus-update-activation-environment.txt
whatis dbus-update-activation-environment >>./HelpMan/dbus-update-activation-environment.txt
dbus-update-activation-environment --help >>./HelpMan/dbus-update-activation-environment.txt
man dbus-update-activation-environment >>./HelpMan/dbus-update-activation-environment.txt
