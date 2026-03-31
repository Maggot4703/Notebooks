#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-tty-ask-password-agent.txt
which systemd-tty-ask-password-agent >>./HelpMan/systemd-tty-ask-password-agent.txt
whatis systemd-tty-ask-password-agent >>./HelpMan/systemd-tty-ask-password-agent.txt
systemd-tty-ask-password-agent --help >>./HelpMan/systemd-tty-ask-password-agent.txt
man systemd-tty-ask-password-agent >>./HelpMan/systemd-tty-ask-password-agent.txt
