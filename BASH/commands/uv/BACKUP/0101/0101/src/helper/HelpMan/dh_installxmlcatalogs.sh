#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dh_installxmlcatalogs.txt
which dh_installxmlcatalogs >>./HelpMan/dh_installxmlcatalogs.txt
whatis dh_installxmlcatalogs >>./HelpMan/dh_installxmlcatalogs.txt
dh_installxmlcatalogs --help >>./HelpMan/dh_installxmlcatalogs.txt
man dh_installxmlcatalogs >>./HelpMan/dh_installxmlcatalogs.txt
