#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bluetooth-sendto.txt
which bluetooth-sendto >>./HelpMan/bluetooth-sendto.txt
whatis bluetooth-sendto >>./HelpMan/bluetooth-sendto.txt
bluetooth-sendto --help >>./HelpMan/bluetooth-sendto.txt
man bluetooth-sendto >>./HelpMan/bluetooth-sendto.txt
