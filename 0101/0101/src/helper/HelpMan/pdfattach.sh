#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pdfattach.txt
which pdfattach >>./HelpMan/pdfattach.txt
whatis pdfattach >>./HelpMan/pdfattach.txt
pdfattach --help >>./HelpMan/pdfattach.txt
man pdfattach >>./HelpMan/pdfattach.txt
