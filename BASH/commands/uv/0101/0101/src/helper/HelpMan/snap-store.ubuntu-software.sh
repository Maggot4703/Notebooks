#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/snap-store.ubuntu-software.txt
which snap-store.ubuntu-software >>./HelpMan/snap-store.ubuntu-software.txt
whatis snap-store.ubuntu-software >>./HelpMan/snap-store.ubuntu-software.txt
snap-store.ubuntu-software --help >>./HelpMan/snap-store.ubuntu-software.txt
man snap-store.ubuntu-software >>./HelpMan/snap-store.ubuntu-software.txt
