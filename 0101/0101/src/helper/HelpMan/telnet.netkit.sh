#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/telnet.netkit.txt
which telnet.netkit >>./HelpMan/telnet.netkit.txt
whatis telnet.netkit >>./HelpMan/telnet.netkit.txt
telnet.netkit --help >>./HelpMan/telnet.netkit.txt
man telnet.netkit >>./HelpMan/telnet.netkit.txt
