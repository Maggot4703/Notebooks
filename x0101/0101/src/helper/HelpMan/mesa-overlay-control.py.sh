#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mesa-overlay-control.py.txt
which mesa-overlay-control.py >>./HelpMan/mesa-overlay-control.py.txt
whatis mesa-overlay-control.py >>./HelpMan/mesa-overlay-control.py.txt
mesa-overlay-control.py --help >>./HelpMan/mesa-overlay-control.py.txt
man mesa-overlay-control.py >>./HelpMan/mesa-overlay-control.py.txt
