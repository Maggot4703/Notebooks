#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-xmlcatalog.txt
which update-xmlcatalog >>./HelpMan/update-xmlcatalog.txt
whatis update-xmlcatalog >>./HelpMan/update-xmlcatalog.txt
update-xmlcatalog --help >>./HelpMan/update-xmlcatalog.txt
man update-xmlcatalog >>./HelpMan/update-xmlcatalog.txt
