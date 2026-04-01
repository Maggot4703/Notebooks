#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/vlc-wrapper.txt
which vlc-wrapper >>./HelpMan/vlc-wrapper.txt
whatis vlc-wrapper >>./HelpMan/vlc-wrapper.txt
vlc-wrapper --help >>./HelpMan/vlc-wrapper.txt
man vlc-wrapper >>./HelpMan/vlc-wrapper.txt
