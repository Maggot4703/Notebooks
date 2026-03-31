#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/avahi-resolve.txt
which avahi-resolve >>./HelpMan/avahi-resolve.txt
whatis avahi-resolve >>./HelpMan/avahi-resolve.txt
avahi-resolve --help >>./HelpMan/avahi-resolve.txt
man avahi-resolve >>./HelpMan/avahi-resolve.txt
