#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fprintd-list.txt
which fprintd-list >>./HelpMan/fprintd-list.txt
whatis fprintd-list >>./HelpMan/fprintd-list.txt
fprintd-list --help >>./HelpMan/fprintd-list.txt
man fprintd-list >>./HelpMan/fprintd-list.txt
