#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lessc.txt
which lessc >>./HelpMan/lessc.txt
whatis lessc >>./HelpMan/lessc.txt
lessc --help >>./HelpMan/lessc.txt
man lessc >>./HelpMan/lessc.txt
