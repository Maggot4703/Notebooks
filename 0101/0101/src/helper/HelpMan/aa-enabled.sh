#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/aa-enabled.txt
which aa-enabled >>./HelpMan/aa-enabled.txt
whatis aa-enabled >>./HelpMan/aa-enabled.txt
aa-enabled --help >>./HelpMan/aa-enabled.txt
man aa-enabled >>./HelpMan/aa-enabled.txt
