#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-testpage.txt
which hp-testpage >>./HelpMan/hp-testpage.txt
whatis hp-testpage >>./HelpMan/hp-testpage.txt
hp-testpage --help >>./HelpMan/hp-testpage.txt
man hp-testpage >>./HelpMan/hp-testpage.txt
