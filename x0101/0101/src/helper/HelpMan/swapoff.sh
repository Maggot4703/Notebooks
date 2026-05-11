#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/swapoff.txt
which swapoff >>./HelpMan/swapoff.txt
whatis swapoff >>./HelpMan/swapoff.txt
swapoff --help >>./HelpMan/swapoff.txt
man swapoff >>./HelpMan/swapoff.txt
