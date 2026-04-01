#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cron.txt
which cron >>./HelpMan/cron.txt
whatis cron >>./HelpMan/cron.txt
cron --help >>./HelpMan/cron.txt
man cron >>./HelpMan/cron.txt
