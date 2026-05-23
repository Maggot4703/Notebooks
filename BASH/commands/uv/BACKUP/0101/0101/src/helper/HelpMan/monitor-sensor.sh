#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/monitor-sensor.txt
which monitor-sensor >>./HelpMan/monitor-sensor.txt
whatis monitor-sensor >>./HelpMan/monitor-sensor.txt
monitor-sensor --help >>./HelpMan/monitor-sensor.txt
man monitor-sensor >>./HelpMan/monitor-sensor.txt
