#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/atobm.txt
which atobm >>./HelpMan/atobm.txt
whatis atobm >>./HelpMan/atobm.txt
atobm --help >>./HelpMan/atobm.txt
man atobm >>./HelpMan/atobm.txt
