#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ghostscript.txt
which ghostscript >>./HelpMan/ghostscript.txt
whatis ghostscript >>./HelpMan/ghostscript.txt
ghostscript --help >>./HelpMan/ghostscript.txt
man ghostscript >>./HelpMan/ghostscript.txt
