#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-dictcommon-aspell.txt
which update-dictcommon-aspell >>./HelpMan/update-dictcommon-aspell.txt
whatis update-dictcommon-aspell >>./HelpMan/update-dictcommon-aspell.txt
update-dictcommon-aspell --help >>./HelpMan/update-dictcommon-aspell.txt
man update-dictcommon-aspell >>./HelpMan/update-dictcommon-aspell.txt
