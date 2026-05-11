#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gdk-pixbuf-csource.txt
which gdk-pixbuf-csource >>./HelpMan/gdk-pixbuf-csource.txt
whatis gdk-pixbuf-csource >>./HelpMan/gdk-pixbuf-csource.txt
gdk-pixbuf-csource --help >>./HelpMan/gdk-pixbuf-csource.txt
man gdk-pixbuf-csource >>./HelpMan/gdk-pixbuf-csource.txt
