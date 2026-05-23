#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/snapcraft.txt
which snapcraft >>./HelpMan/snapcraft.txt
whatis snapcraft >>./HelpMan/snapcraft.txt
snapcraft --help >>./HelpMan/snapcraft.txt
man snapcraft >>./HelpMan/snapcraft.txt
