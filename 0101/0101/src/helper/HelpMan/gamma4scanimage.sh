#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gamma4scanimage.txt
which gamma4scanimage >>./HelpMan/gamma4scanimage.txt
whatis gamma4scanimage >>./HelpMan/gamma4scanimage.txt
gamma4scanimage --help >>./HelpMan/gamma4scanimage.txt
man gamma4scanimage >>./HelpMan/gamma4scanimage.txt
