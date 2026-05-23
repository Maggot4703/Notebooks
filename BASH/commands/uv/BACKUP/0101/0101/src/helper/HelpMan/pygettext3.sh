#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pygettext3.txt
which pygettext3 >>./HelpMan/pygettext3.txt
whatis pygettext3 >>./HelpMan/pygettext3.txt
pygettext3 --help >>./HelpMan/pygettext3.txt
man pygettext3 >>./HelpMan/pygettext3.txt
