#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/snap-store.ubuntu-software-local-file.txt
which snap-store.ubuntu-software-local-file >>./HelpMan/snap-store.ubuntu-software-local-file.txt
whatis snap-store.ubuntu-software-local-file >>./HelpMan/snap-store.ubuntu-software-local-file.txt
snap-store.ubuntu-software-local-file --help >>./HelpMan/snap-store.ubuntu-software-local-file.txt
man snap-store.ubuntu-software-local-file >>./HelpMan/snap-store.ubuntu-software-local-file.txt
