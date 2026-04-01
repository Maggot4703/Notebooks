#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/vboxmanage.txt
which vboxmanage >>./HelpMan/vboxmanage.txt
whatis vboxmanage >>./HelpMan/vboxmanage.txt
vboxmanage --help >>./HelpMan/vboxmanage.txt
man vboxmanage >>./HelpMan/vboxmanage.txt
