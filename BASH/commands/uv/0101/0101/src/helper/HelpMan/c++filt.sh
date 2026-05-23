#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/c++filt.txt
which c++filt >>./HelpMan/c++filt.txt
whatis c++filt >>./HelpMan/c++filt.txt
c++filt --help >>./HelpMan/c++filt.txt
man c++filt >>./HelpMan/c++filt.txt
