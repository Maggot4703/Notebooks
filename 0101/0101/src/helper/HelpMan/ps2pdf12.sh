#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ps2pdf12.txt
which ps2pdf12 >>./HelpMan/ps2pdf12.txt
whatis ps2pdf12 >>./HelpMan/ps2pdf12.txt
ps2pdf12 --help >>./HelpMan/ps2pdf12.txt
man ps2pdf12 >>./HelpMan/ps2pdf12.txt
