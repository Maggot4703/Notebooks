#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/avahi-publish-service.txt
which avahi-publish-service >>./HelpMan/avahi-publish-service.txt
whatis avahi-publish-service >>./HelpMan/avahi-publish-service.txt
avahi-publish-service --help >>./HelpMan/avahi-publish-service.txt
man avahi-publish-service >>./HelpMan/avahi-publish-service.txt
