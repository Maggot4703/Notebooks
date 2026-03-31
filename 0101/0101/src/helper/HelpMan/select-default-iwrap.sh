#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/select-default-iwrap.txt
which select-default-iwrap >>./HelpMan/select-default-iwrap.txt
whatis select-default-iwrap >>./HelpMan/select-default-iwrap.txt
select-default-iwrap --help >>./HelpMan/select-default-iwrap.txt
man select-default-iwrap >>./HelpMan/select-default-iwrap.txt
