#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/aspell-autobuildhash.txt
which aspell-autobuildhash >>./HelpMan/aspell-autobuildhash.txt
whatis aspell-autobuildhash >>./HelpMan/aspell-autobuildhash.txt
aspell-autobuildhash --help >>./HelpMan/aspell-autobuildhash.txt
man aspell-autobuildhash >>./HelpMan/aspell-autobuildhash.txt
