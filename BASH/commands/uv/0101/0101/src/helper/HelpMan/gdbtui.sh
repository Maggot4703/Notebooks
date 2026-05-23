#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gdbtui.txt
which gdbtui >>./HelpMan/gdbtui.txt
whatis gdbtui >>./HelpMan/gdbtui.txt
gdbtui --help >>./HelpMan/gdbtui.txt
man gdbtui >>./HelpMan/gdbtui.txt
