#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cvt.txt
which cvt >>./HelpMan/cvt.txt
whatis cvt >>./HelpMan/cvt.txt
cvt --help >>./HelpMan/cvt.txt
man cvt >>./HelpMan/cvt.txt
