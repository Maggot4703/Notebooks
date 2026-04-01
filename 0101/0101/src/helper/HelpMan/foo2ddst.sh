#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2ddst.txt
which foo2ddst >>./HelpMan/foo2ddst.txt
whatis foo2ddst >>./HelpMan/foo2ddst.txt
foo2ddst --help >>./HelpMan/foo2ddst.txt
man foo2ddst >>./HelpMan/foo2ddst.txt
