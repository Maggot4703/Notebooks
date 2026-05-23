#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/traceroute6.iputils.txt
which traceroute6.iputils >>./HelpMan/traceroute6.iputils.txt
whatis traceroute6.iputils >>./HelpMan/traceroute6.iputils.txt
traceroute6.iputils --help >>./HelpMan/traceroute6.iputils.txt
man traceroute6.iputils >>./HelpMan/traceroute6.iputils.txt
