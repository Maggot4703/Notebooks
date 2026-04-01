#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/quote_readline.txt
which quote_readline >>./HelpMan/quote_readline.txt
whatis quote_readline >>./HelpMan/quote_readline.txt
quote_readline --help >>./HelpMan/quote_readline.txt
man quote_readline >>./HelpMan/quote_readline.txt
