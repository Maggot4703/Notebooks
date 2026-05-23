#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bluetoothctl.txt
which bluetoothctl >>./HelpMan/bluetoothctl.txt
whatis bluetoothctl >>./HelpMan/bluetoothctl.txt
bluetoothctl --help >>./HelpMan/bluetoothctl.txt
man bluetoothctl >>./HelpMan/bluetoothctl.txt
