#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xzegrep.txt
which xzegrep >>./HelpMan/xzegrep.txt
whatis xzegrep >>./HelpMan/xzegrep.txt
xzegrep --help >>./HelpMan/xzegrep.txt
man xzegrep >>./HelpMan/xzegrep.txt
