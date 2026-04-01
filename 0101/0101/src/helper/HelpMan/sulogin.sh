#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sulogin.txt
which sulogin >>./HelpMan/sulogin.txt
whatis sulogin >>./HelpMan/sulogin.txt
sulogin --help >>./HelpMan/sulogin.txt
man sulogin >>./HelpMan/sulogin.txt
