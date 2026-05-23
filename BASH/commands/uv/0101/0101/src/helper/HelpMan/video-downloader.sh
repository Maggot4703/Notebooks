#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/video-downloader.txt
which video-downloader >>./HelpMan/video-downloader.txt
whatis video-downloader >>./HelpMan/video-downloader.txt
video-downloader --help >>./HelpMan/video-downloader.txt
man video-downloader >>./HelpMan/video-downloader.txt
