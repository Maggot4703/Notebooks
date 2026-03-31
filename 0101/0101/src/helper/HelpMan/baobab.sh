#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/baobab.txt
which baobab >>./HelpMan/baobab.txt
whatis baobab >>./HelpMan/baobab.txt
baobab --help >>./HelpMan/baobab.txt
man baobab >>./HelpMan/baobab.txt
