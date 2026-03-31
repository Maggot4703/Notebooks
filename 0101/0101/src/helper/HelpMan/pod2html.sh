#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pod2html.txt
which pod2html >>./HelpMan/pod2html.txt
whatis pod2html >>./HelpMan/pod2html.txt
pod2html --help >>./HelpMan/pod2html.txt
man pod2html >>./HelpMan/pod2html.txt
