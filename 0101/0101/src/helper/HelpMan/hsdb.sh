#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hsdb.txt
which hsdb >>./HelpMan/hsdb.txt
whatis hsdb >>./HelpMan/hsdb.txt
hsdb --help >>./HelpMan/hsdb.txt
man hsdb >>./HelpMan/hsdb.txt
