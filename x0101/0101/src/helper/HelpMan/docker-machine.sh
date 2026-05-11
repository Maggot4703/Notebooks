#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/docker-machine.txt
which docker-machine >>./HelpMan/docker-machine.txt
whatis docker-machine >>./HelpMan/docker-machine.txt
docker-machine --help >>./HelpMan/docker-machine.txt
man docker-machine >>./HelpMan/docker-machine.txt
