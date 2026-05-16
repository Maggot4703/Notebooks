#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/elfedit.txt
which elfedit >>./HelpMan/elfedit.txt
whatis elfedit >>./HelpMan/elfedit.txt
elfedit --help >>./HelpMan/elfedit.txt
man elfedit >>./HelpMan/elfedit.txt
