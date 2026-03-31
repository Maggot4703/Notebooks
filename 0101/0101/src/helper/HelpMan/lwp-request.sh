#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lwp-request.txt
which lwp-request >>./HelpMan/lwp-request.txt
whatis lwp-request >>./HelpMan/lwp-request.txt
lwp-request --help >>./HelpMan/lwp-request.txt
man lwp-request >>./HelpMan/lwp-request.txt
