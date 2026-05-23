#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pam_timestamp_check.txt
which pam_timestamp_check >>./HelpMan/pam_timestamp_check.txt
whatis pam_timestamp_check >>./HelpMan/pam_timestamp_check.txt
pam_timestamp_check --help >>./HelpMan/pam_timestamp_check.txt
man pam_timestamp_check >>./HelpMan/pam_timestamp_check.txt
