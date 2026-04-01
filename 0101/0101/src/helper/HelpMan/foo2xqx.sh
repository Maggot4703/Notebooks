#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2xqx.txt
which foo2xqx >>./HelpMan/foo2xqx.txt
whatis foo2xqx >>./HelpMan/foo2xqx.txt
foo2xqx --help >>./HelpMan/foo2xqx.txt
man foo2xqx >>./HelpMan/foo2xqx.txt
