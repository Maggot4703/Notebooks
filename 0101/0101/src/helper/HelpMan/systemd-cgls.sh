#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-cgls.txt
which systemd-cgls >>./HelpMan/systemd-cgls.txt
whatis systemd-cgls >>./HelpMan/systemd-cgls.txt
systemd-cgls --help >>./HelpMan/systemd-cgls.txt
man systemd-cgls >>./HelpMan/systemd-cgls.txt
