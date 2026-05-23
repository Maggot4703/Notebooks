#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2hp.txt
which foo2hp >>./HelpMan/foo2hp.txt
whatis foo2hp >>./HelpMan/foo2hp.txt
foo2hp --help >>./HelpMan/foo2hp.txt
man foo2hp >>./HelpMan/foo2hp.txt
