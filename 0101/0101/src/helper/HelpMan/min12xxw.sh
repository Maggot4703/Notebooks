#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/min12xxw.txt
which min12xxw >>./HelpMan/min12xxw.txt
whatis min12xxw >>./HelpMan/min12xxw.txt
min12xxw --help >>./HelpMan/min12xxw.txt
man min12xxw >>./HelpMan/min12xxw.txt
