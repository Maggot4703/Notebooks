#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pinentry-gnome3.txt
which pinentry-gnome3 >>./HelpMan/pinentry-gnome3.txt
whatis pinentry-gnome3 >>./HelpMan/pinentry-gnome3.txt
pinentry-gnome3 --help >>./HelpMan/pinentry-gnome3.txt
man pinentry-gnome3 >>./HelpMan/pinentry-gnome3.txt
