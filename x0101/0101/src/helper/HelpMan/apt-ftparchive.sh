#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/apt-ftparchive.txt
which apt-ftparchive >>./HelpMan/apt-ftparchive.txt
whatis apt-ftparchive >>./HelpMan/apt-ftparchive.txt
apt-ftparchive --help >>./HelpMan/apt-ftparchive.txt
man apt-ftparchive >>./HelpMan/apt-ftparchive.txt
