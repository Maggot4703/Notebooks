#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/linux-check-removal.txt
which linux-check-removal >>./HelpMan/linux-check-removal.txt
whatis linux-check-removal >>./HelpMan/linux-check-removal.txt
linux-check-removal --help >>./HelpMan/linux-check-removal.txt
man linux-check-removal >>./HelpMan/linux-check-removal.txt
