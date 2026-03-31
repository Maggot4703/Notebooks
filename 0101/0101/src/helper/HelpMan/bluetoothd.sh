#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bluetoothd.txt
which bluetoothd >>./HelpMan/bluetoothd.txt
whatis bluetoothd >>./HelpMan/bluetoothd.txt
bluetoothd --help >>./HelpMan/bluetoothd.txt
man bluetoothd >>./HelpMan/bluetoothd.txt
