#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/w.procps.txt
which w.procps >>./HelpMan/w.procps.txt
whatis w.procps >>./HelpMan/w.procps.txt
w.procps --help >>./HelpMan/w.procps.txt
man w.procps >>./HelpMan/w.procps.txt
