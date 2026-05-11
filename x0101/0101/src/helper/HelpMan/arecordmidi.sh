#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/arecordmidi.txt
which arecordmidi >>./HelpMan/arecordmidi.txt
whatis arecordmidi >>./HelpMan/arecordmidi.txt
arecordmidi --help >>./HelpMan/arecordmidi.txt
man arecordmidi >>./HelpMan/arecordmidi.txt
