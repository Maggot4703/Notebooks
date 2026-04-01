#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ps2pdf14.txt
which ps2pdf14 >>./HelpMan/ps2pdf14.txt
whatis ps2pdf14 >>./HelpMan/ps2pdf14.txt
ps2pdf14 --help >>./HelpMan/ps2pdf14.txt
man ps2pdf14 >>./HelpMan/ps2pdf14.txt
