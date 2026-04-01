#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/aa-status.txt
which aa-status >>./HelpMan/aa-status.txt
whatis aa-status >>./HelpMan/aa-status.txt
aa-status --help >>./HelpMan/aa-status.txt
man aa-status >>./HelpMan/aa-status.txt
