#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2xqx-wrapper.txt
which foo2xqx-wrapper >>./HelpMan/foo2xqx-wrapper.txt
whatis foo2xqx-wrapper >>./HelpMan/foo2xqx-wrapper.txt
foo2xqx-wrapper --help >>./HelpMan/foo2xqx-wrapper.txt
man foo2xqx-wrapper >>./HelpMan/foo2xqx-wrapper.txt
