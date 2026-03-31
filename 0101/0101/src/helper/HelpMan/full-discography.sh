#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/full-discography.txt
which full-discography >>./HelpMan/full-discography.txt
whatis full-discography >>./HelpMan/full-discography.txt
full-discography --help >>./HelpMan/full-discography.txt
man full-discography >>./HelpMan/full-discography.txt
