#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lwp-dump.txt
which lwp-dump >>./HelpMan/lwp-dump.txt
whatis lwp-dump >>./HelpMan/lwp-dump.txt
lwp-dump --help >>./HelpMan/lwp-dump.txt
man lwp-dump >>./HelpMan/lwp-dump.txt
