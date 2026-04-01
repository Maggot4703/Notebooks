#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/systemd-stdio-bridge.txt
which systemd-stdio-bridge >>./HelpMan/systemd-stdio-bridge.txt
whatis systemd-stdio-bridge >>./HelpMan/systemd-stdio-bridge.txt
systemd-stdio-bridge --help >>./HelpMan/systemd-stdio-bridge.txt
man systemd-stdio-bridge >>./HelpMan/systemd-stdio-bridge.txt
