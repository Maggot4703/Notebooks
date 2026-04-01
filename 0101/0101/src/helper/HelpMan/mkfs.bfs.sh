#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mkfs.bfs.txt
which mkfs.bfs >>./HelpMan/mkfs.bfs.txt
whatis mkfs.bfs >>./HelpMan/mkfs.bfs.txt
mkfs.bfs --help >>./HelpMan/mkfs.bfs.txt
man mkfs.bfs >>./HelpMan/mkfs.bfs.txt
