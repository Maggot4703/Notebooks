#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/colcrt.txt
which colcrt >>./HelpMan/colcrt.txt
whatis colcrt >>./HelpMan/colcrt.txt
colcrt --help >>./HelpMan/colcrt.txt
man colcrt >>./HelpMan/colcrt.txt
