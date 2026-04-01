#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/networkd-dispatcher.txt
which networkd-dispatcher >>./HelpMan/networkd-dispatcher.txt
whatis networkd-dispatcher >>./HelpMan/networkd-dispatcher.txt
networkd-dispatcher --help >>./HelpMan/networkd-dispatcher.txt
man networkd-dispatcher >>./HelpMan/networkd-dispatcher.txt
