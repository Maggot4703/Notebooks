#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xmessage.txt
which xmessage >>./HelpMan/xmessage.txt
whatis xmessage >>./HelpMan/xmessage.txt
xmessage --help >>./HelpMan/xmessage.txt
man xmessage >>./HelpMan/xmessage.txt
