#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/faked-tcp.txt
which faked-tcp >>./HelpMan/faked-tcp.txt
whatis faked-tcp >>./HelpMan/faked-tcp.txt
faked-tcp --help >>./HelpMan/faked-tcp.txt
man faked-tcp >>./HelpMan/faked-tcp.txt
