#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/apt-sortpkgs.txt
which apt-sortpkgs >>./HelpMan/apt-sortpkgs.txt
whatis apt-sortpkgs >>./HelpMan/apt-sortpkgs.txt
apt-sortpkgs --help >>./HelpMan/apt-sortpkgs.txt
man apt-sortpkgs >>./HelpMan/apt-sortpkgs.txt
