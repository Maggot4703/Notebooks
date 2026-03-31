#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/system-config-printer.txt
which system-config-printer >>./HelpMan/system-config-printer.txt
whatis system-config-printer >>./HelpMan/system-config-printer.txt
system-config-printer --help >>./HelpMan/system-config-printer.txt
man system-config-printer >>./HelpMan/system-config-printer.txt
