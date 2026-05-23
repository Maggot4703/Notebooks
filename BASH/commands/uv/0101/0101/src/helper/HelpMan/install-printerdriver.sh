#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/install-printerdriver.txt
which install-printerdriver >>./HelpMan/install-printerdriver.txt
whatis install-printerdriver >>./HelpMan/install-printerdriver.txt
install-printerdriver --help >>./HelpMan/install-printerdriver.txt
man install-printerdriver >>./HelpMan/install-printerdriver.txt
