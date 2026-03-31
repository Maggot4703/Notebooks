#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/genisoimage.txt
which genisoimage >>./HelpMan/genisoimage.txt
whatis genisoimage >>./HelpMan/genisoimage.txt
genisoimage --help >>./HelpMan/genisoimage.txt
man genisoimage >>./HelpMan/genisoimage.txt
