#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/qr-code-generator-desktop.txt
which qr-code-generator-desktop >>./HelpMan/qr-code-generator-desktop.txt
whatis qr-code-generator-desktop >>./HelpMan/qr-code-generator-desktop.txt
qr-code-generator-desktop --help >>./HelpMan/qr-code-generator-desktop.txt
man qr-code-generator-desktop >>./HelpMan/qr-code-generator-desktop.txt
