#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mk_modmap.txt
which mk_modmap >>./HelpMan/mk_modmap.txt
whatis mk_modmap >>./HelpMan/mk_modmap.txt
mk_modmap --help >>./HelpMan/mk_modmap.txt
man mk_modmap >>./HelpMan/mk_modmap.txt
