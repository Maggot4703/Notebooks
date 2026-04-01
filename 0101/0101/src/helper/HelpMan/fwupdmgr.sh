#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fwupdmgr.txt
which fwupdmgr >>./HelpMan/fwupdmgr.txt
whatis fwupdmgr >>./HelpMan/fwupdmgr.txt
fwupdmgr --help >>./HelpMan/fwupdmgr.txt
man fwupdmgr >>./HelpMan/fwupdmgr.txt
