#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/podselect.txt
which podselect >>./HelpMan/podselect.txt
whatis podselect >>./HelpMan/podselect.txt
podselect --help >>./HelpMan/podselect.txt
man podselect >>./HelpMan/podselect.txt
