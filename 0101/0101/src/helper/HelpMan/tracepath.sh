#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/tracepath.txt
which tracepath >>./HelpMan/tracepath.txt
whatis tracepath >>./HelpMan/tracepath.txt
tracepath --help >>./HelpMan/tracepath.txt
man tracepath >>./HelpMan/tracepath.txt
