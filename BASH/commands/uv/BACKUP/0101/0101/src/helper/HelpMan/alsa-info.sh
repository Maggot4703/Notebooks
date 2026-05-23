#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/alsa-info.txt
which alsa-info >>./HelpMan/alsa-info.txt
whatis alsa-info >>./HelpMan/alsa-info.txt
alsa-info --help >>./HelpMan/alsa-info.txt
man alsa-info >>./HelpMan/alsa-info.txt
