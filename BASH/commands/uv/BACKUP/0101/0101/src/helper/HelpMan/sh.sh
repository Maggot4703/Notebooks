#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sh.txt
which sh >>./HelpMan/sh.txt
whatis sh >>./HelpMan/sh.txt
sh --help >>./HelpMan/sh.txt
man sh >>./HelpMan/sh.txt
