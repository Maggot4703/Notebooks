#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/psfxtable.txt
which psfxtable >>./HelpMan/psfxtable.txt
whatis psfxtable >>./HelpMan/psfxtable.txt
psfxtable --help >>./HelpMan/psfxtable.txt
man psfxtable >>./HelpMan/psfxtable.txt
