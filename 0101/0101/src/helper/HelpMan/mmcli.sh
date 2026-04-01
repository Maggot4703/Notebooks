#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mmcli.txt
which mmcli >>./HelpMan/mmcli.txt
whatis mmcli >>./HelpMan/mmcli.txt
mmcli --help >>./HelpMan/mmcli.txt
man mmcli >>./HelpMan/mmcli.txt
