#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ua.txt
which ua >>./HelpMan/ua.txt
whatis ua >>./HelpMan/ua.txt
ua --help >>./HelpMan/ua.txt
man ua >>./HelpMan/ua.txt
