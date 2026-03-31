#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sensible-pager.txt
which sensible-pager >>./HelpMan/sensible-pager.txt
whatis sensible-pager >>./HelpMan/sensible-pager.txt
sensible-pager --help >>./HelpMan/sensible-pager.txt
man sensible-pager >>./HelpMan/sensible-pager.txt
