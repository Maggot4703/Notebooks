#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/avahi-browse-domains.txt
which avahi-browse-domains >>./HelpMan/avahi-browse-domains.txt
whatis avahi-browse-domains >>./HelpMan/avahi-browse-domains.txt
avahi-browse-domains --help >>./HelpMan/avahi-browse-domains.txt
man avahi-browse-domains >>./HelpMan/avahi-browse-domains.txt
