#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ssh-agent.txt
which ssh-agent >>./HelpMan/ssh-agent.txt
whatis ssh-agent >>./HelpMan/ssh-agent.txt
ssh-agent --help >>./HelpMan/ssh-agent.txt
man ssh-agent >>./HelpMan/ssh-agent.txt
