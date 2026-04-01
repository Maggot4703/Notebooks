#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/devlink.txt
which devlink >>./HelpMan/devlink.txt
whatis devlink >>./HelpMan/devlink.txt
devlink --help >>./HelpMan/devlink.txt
man devlink >>./HelpMan/devlink.txt
