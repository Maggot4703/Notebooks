#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/usb_printerid.txt
which usb_printerid >>./HelpMan/usb_printerid.txt
whatis usb_printerid >>./HelpMan/usb_printerid.txt
usb_printerid --help >>./HelpMan/usb_printerid.txt
man usb_printerid >>./HelpMan/usb_printerid.txt
