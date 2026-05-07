#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ddstdecode.txt
which ddstdecode >>./HelpMan/ddstdecode.txt
whatis ddstdecode >>./HelpMan/ddstdecode.txt
ddstdecode --help >>./HelpMan/ddstdecode.txt
man ddstdecode >>./HelpMan/ddstdecode.txt
