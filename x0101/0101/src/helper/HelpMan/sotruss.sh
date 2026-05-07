#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sotruss.txt
which sotruss >>./HelpMan/sotruss.txt
whatis sotruss >>./HelpMan/sotruss.txt
sotruss --help >>./HelpMan/sotruss.txt
man sotruss >>./HelpMan/sotruss.txt
