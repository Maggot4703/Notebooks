#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/vboxheadless.txt
which vboxheadless >>./HelpMan/vboxheadless.txt
whatis vboxheadless >>./HelpMan/vboxheadless.txt
vboxheadless --help >>./HelpMan/vboxheadless.txt
man vboxheadless >>./HelpMan/vboxheadless.txt
