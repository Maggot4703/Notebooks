#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/system-config-printer-applet.txt
which system-config-printer-applet >>./HelpMan/system-config-printer-applet.txt
whatis system-config-printer-applet >>./HelpMan/system-config-printer-applet.txt
system-config-printer-applet --help >>./HelpMan/system-config-printer-applet.txt
man system-config-printer-applet >>./HelpMan/system-config-printer-applet.txt
