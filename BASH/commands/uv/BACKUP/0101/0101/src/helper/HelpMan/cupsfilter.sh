#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cupsfilter.txt
which cupsfilter >>./HelpMan/cupsfilter.txt
whatis cupsfilter >>./HelpMan/cupsfilter.txt
cupsfilter --help >>./HelpMan/cupsfilter.txt
man cupsfilter >>./HelpMan/cupsfilter.txt
