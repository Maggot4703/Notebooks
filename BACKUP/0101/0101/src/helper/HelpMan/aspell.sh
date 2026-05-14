#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/aspell.txt
which aspell >>./HelpMan/aspell.txt
whatis aspell >>./HelpMan/aspell.txt
aspell --help >>./HelpMan/aspell.txt
man aspell >>./HelpMan/aspell.txt
