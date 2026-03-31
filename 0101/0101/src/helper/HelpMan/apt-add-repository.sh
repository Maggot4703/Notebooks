#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/apt-add-repository.txt
which apt-add-repository >>./HelpMan/apt-add-repository.txt
whatis apt-add-repository >>./HelpMan/apt-add-repository.txt
apt-add-repository --help >>./HelpMan/apt-add-repository.txt
man apt-add-repository >>./HelpMan/apt-add-repository.txt
