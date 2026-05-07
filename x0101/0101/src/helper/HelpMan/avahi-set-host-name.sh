#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/avahi-set-host-name.txt
which avahi-set-host-name >>./HelpMan/avahi-set-host-name.txt
whatis avahi-set-host-name >>./HelpMan/avahi-set-host-name.txt
avahi-set-host-name --help >>./HelpMan/avahi-set-host-name.txt
man avahi-set-host-name >>./HelpMan/avahi-set-host-name.txt
