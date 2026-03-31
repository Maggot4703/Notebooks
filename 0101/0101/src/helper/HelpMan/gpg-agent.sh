#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gpg-agent.txt
which gpg-agent >>./HelpMan/gpg-agent.txt
whatis gpg-agent >>./HelpMan/gpg-agent.txt
gpg-agent --help >>./HelpMan/gpg-agent.txt
man gpg-agent >>./HelpMan/gpg-agent.txt
