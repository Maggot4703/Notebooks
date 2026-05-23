#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/snap-store.txt
which snap-store >>./HelpMan/snap-store.txt
whatis snap-store >>./HelpMan/snap-store.txt
snap-store --help >>./HelpMan/snap-store.txt
man snap-store >>./HelpMan/snap-store.txt
