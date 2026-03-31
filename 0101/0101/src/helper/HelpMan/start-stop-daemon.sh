#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/start-stop-daemon.txt
which start-stop-daemon >>./HelpMan/start-stop-daemon.txt
whatis start-stop-daemon >>./HelpMan/start-stop-daemon.txt
start-stop-daemon --help >>./HelpMan/start-stop-daemon.txt
man start-stop-daemon >>./HelpMan/start-stop-daemon.txt
