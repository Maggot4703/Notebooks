#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/unopkg.txt
which unopkg >>./HelpMan/unopkg.txt
whatis unopkg >>./HelpMan/unopkg.txt
unopkg --help >>./HelpMan/unopkg.txt
man unopkg >>./HelpMan/unopkg.txt
