#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/chmem.txt
which chmem >>./HelpMan/chmem.txt
whatis chmem >>./HelpMan/chmem.txt
chmem --help >>./HelpMan/chmem.txt
man chmem >>./HelpMan/chmem.txt
