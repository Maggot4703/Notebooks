#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/validlocale.txt
which validlocale >>./HelpMan/validlocale.txt
whatis validlocale >>./HelpMan/validlocale.txt
validlocale --help >>./HelpMan/validlocale.txt
man validlocale >>./HelpMan/validlocale.txt
