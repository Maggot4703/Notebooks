#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bmtoa.txt
which bmtoa >>./HelpMan/bmtoa.txt
whatis bmtoa >>./HelpMan/bmtoa.txt
bmtoa --help >>./HelpMan/bmtoa.txt
man bmtoa >>./HelpMan/bmtoa.txt
