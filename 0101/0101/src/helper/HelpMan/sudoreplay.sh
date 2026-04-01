#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sudoreplay.txt
which sudoreplay >>./HelpMan/sudoreplay.txt
whatis sudoreplay >>./HelpMan/sudoreplay.txt
sudoreplay --help >>./HelpMan/sudoreplay.txt
man sudoreplay >>./HelpMan/sudoreplay.txt
