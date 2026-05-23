#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fprintd-delete.txt
which fprintd-delete >>./HelpMan/fprintd-delete.txt
whatis fprintd-delete >>./HelpMan/fprintd-delete.txt
fprintd-delete --help >>./HelpMan/fprintd-delete.txt
man fprintd-delete >>./HelpMan/fprintd-delete.txt
