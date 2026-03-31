#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cupsdisable.txt
which cupsdisable >>./HelpMan/cupsdisable.txt
whatis cupsdisable >>./HelpMan/cupsdisable.txt
cupsdisable --help >>./HelpMan/cupsdisable.txt
man cupsdisable >>./HelpMan/cupsdisable.txt
