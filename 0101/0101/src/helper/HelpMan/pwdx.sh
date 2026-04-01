#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pwdx.txt
which pwdx >>./HelpMan/pwdx.txt
whatis pwdx >>./HelpMan/pwdx.txt
pwdx --help >>./HelpMan/pwdx.txt
man pwdx >>./HelpMan/pwdx.txt
