#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-logcapture.txt
which hp-logcapture >>./HelpMan/hp-logcapture.txt
whatis hp-logcapture >>./HelpMan/hp-logcapture.txt
hp-logcapture --help >>./HelpMan/hp-logcapture.txt
man hp-logcapture >>./HelpMan/hp-logcapture.txt
