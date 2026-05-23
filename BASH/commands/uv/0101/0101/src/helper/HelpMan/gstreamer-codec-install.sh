#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gstreamer-codec-install.txt
which gstreamer-codec-install >>./HelpMan/gstreamer-codec-install.txt
whatis gstreamer-codec-install >>./HelpMan/gstreamer-codec-install.txt
gstreamer-codec-install --help >>./HelpMan/gstreamer-codec-install.txt
man gstreamer-codec-install >>./HelpMan/gstreamer-codec-install.txt
