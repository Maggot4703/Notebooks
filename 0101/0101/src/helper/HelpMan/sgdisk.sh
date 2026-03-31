#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sgdisk.txt
which sgdisk >>./HelpMan/sgdisk.txt
whatis sgdisk >>./HelpMan/sgdisk.txt
sgdisk --help >>./HelpMan/sgdisk.txt
man sgdisk >>./HelpMan/sgdisk.txt
