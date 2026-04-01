#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nautilus-sendto.txt
which nautilus-sendto >>./HelpMan/nautilus-sendto.txt
whatis nautilus-sendto >>./HelpMan/nautilus-sendto.txt
nautilus-sendto --help >>./HelpMan/nautilus-sendto.txt
man nautilus-sendto >>./HelpMan/nautilus-sendto.txt
