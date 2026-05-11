#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/avahi-resolve-host-name.txt
which avahi-resolve-host-name >>./HelpMan/avahi-resolve-host-name.txt
whatis avahi-resolve-host-name >>./HelpMan/avahi-resolve-host-name.txt
avahi-resolve-host-name --help >>./HelpMan/avahi-resolve-host-name.txt
man avahi-resolve-host-name >>./HelpMan/avahi-resolve-host-name.txt
