#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/usbmuxd.txt
which usbmuxd >>./HelpMan/usbmuxd.txt
whatis usbmuxd >>./HelpMan/usbmuxd.txt
usbmuxd --help >>./HelpMan/usbmuxd.txt
man usbmuxd >>./HelpMan/usbmuxd.txt
