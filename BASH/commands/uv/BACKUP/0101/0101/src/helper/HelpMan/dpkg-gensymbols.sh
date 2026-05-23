#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-gensymbols.txt
which dpkg-gensymbols >>./HelpMan/dpkg-gensymbols.txt
whatis dpkg-gensymbols >>./HelpMan/dpkg-gensymbols.txt
dpkg-gensymbols --help >>./HelpMan/dpkg-gensymbols.txt
man dpkg-gensymbols >>./HelpMan/dpkg-gensymbols.txt
