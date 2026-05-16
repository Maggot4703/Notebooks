#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xtables-monitor.txt
which xtables-monitor >>./HelpMan/xtables-monitor.txt
whatis xtables-monitor >>./HelpMan/xtables-monitor.txt
xtables-monitor --help >>./HelpMan/xtables-monitor.txt
man xtables-monitor >>./HelpMan/xtables-monitor.txt
