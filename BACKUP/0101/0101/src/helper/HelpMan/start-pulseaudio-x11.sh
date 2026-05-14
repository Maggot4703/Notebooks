#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/start-pulseaudio-x11.txt
which start-pulseaudio-x11 >>./HelpMan/start-pulseaudio-x11.txt
whatis start-pulseaudio-x11 >>./HelpMan/start-pulseaudio-x11.txt
start-pulseaudio-x11 --help >>./HelpMan/start-pulseaudio-x11.txt
man start-pulseaudio-x11 >>./HelpMan/start-pulseaudio-x11.txt
