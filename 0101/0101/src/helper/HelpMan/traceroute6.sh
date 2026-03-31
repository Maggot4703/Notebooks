#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/traceroute6.txt
which traceroute6 >>./HelpMan/traceroute6.txt
whatis traceroute6 >>./HelpMan/traceroute6.txt
traceroute6 --help >>./HelpMan/traceroute6.txt
man traceroute6 >>./HelpMan/traceroute6.txt
