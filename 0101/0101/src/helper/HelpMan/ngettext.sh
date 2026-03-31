#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ngettext.txt
which ngettext >>./HelpMan/ngettext.txt
whatis ngettext >>./HelpMan/ngettext.txt
ngettext --help >>./HelpMan/ngettext.txt
man ngettext >>./HelpMan/ngettext.txt
