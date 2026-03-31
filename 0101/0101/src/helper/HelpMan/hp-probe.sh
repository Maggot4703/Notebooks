#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-probe.txt
which hp-probe >>./HelpMan/hp-probe.txt
whatis hp-probe >>./HelpMan/hp-probe.txt
hp-probe --help >>./HelpMan/hp-probe.txt
man hp-probe >>./HelpMan/hp-probe.txt
