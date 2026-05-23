#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/umax_pp.txt
which umax_pp >>./HelpMan/umax_pp.txt
whatis umax_pp >>./HelpMan/umax_pp.txt
umax_pp --help >>./HelpMan/umax_pp.txt
man umax_pp >>./HelpMan/umax_pp.txt
