#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/resize2fs.txt
which resize2fs >>./HelpMan/resize2fs.txt
whatis resize2fs >>./HelpMan/resize2fs.txt
resize2fs --help >>./HelpMan/resize2fs.txt
man resize2fs >>./HelpMan/resize2fs.txt
