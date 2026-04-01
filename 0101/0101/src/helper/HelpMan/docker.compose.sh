#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/docker.compose.txt
which docker.compose >>./HelpMan/docker.compose.txt
whatis docker.compose >>./HelpMan/docker.compose.txt
docker.compose --help >>./HelpMan/docker.compose.txt
man docker.compose >>./HelpMan/docker.compose.txt
