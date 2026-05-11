#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/java.txt
which java >>./HelpMan/java.txt
whatis java >>./HelpMan/java.txt
java --help >>./HelpMan/java.txt
man java >>./HelpMan/java.txt
