#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/docker.txt
which docker >>./HelpMan/docker.txt
whatis docker >>./HelpMan/docker.txt
docker --help >>./HelpMan/docker.txt
man docker >>./HelpMan/docker.txt
