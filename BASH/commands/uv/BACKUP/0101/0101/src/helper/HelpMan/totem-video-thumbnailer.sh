#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/totem-video-thumbnailer.txt
which totem-video-thumbnailer >>./HelpMan/totem-video-thumbnailer.txt
whatis totem-video-thumbnailer >>./HelpMan/totem-video-thumbnailer.txt
totem-video-thumbnailer --help >>./HelpMan/totem-video-thumbnailer.txt
man totem-video-thumbnailer >>./HelpMan/totem-video-thumbnailer.txt
