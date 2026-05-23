#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pushd.txt
which pushd >>./HelpMan/pushd.txt
whatis pushd >>./HelpMan/pushd.txt
pushd --help >>./HelpMan/pushd.txt
man pushd >>./HelpMan/pushd.txt
