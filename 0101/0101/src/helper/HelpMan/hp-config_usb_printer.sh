#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-config_usb_printer.txt
which hp-config_usb_printer >>./HelpMan/hp-config_usb_printer.txt
whatis hp-config_usb_printer >>./HelpMan/hp-config_usb_printer.txt
hp-config_usb_printer --help >>./HelpMan/hp-config_usb_printer.txt
man hp-config_usb_printer >>./HelpMan/hp-config_usb_printer.txt
