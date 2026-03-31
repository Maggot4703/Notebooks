#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/yelp.txt
which yelp >>./HelpMan/yelp.txt
whatis yelp >>./HelpMan/yelp.txt
yelp --help >>./HelpMan/yelp.txt
man yelp >>./HelpMan/yelp.txt
