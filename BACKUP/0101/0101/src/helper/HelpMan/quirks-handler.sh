#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/quirks-handler.txt
which quirks-handler >>./HelpMan/quirks-handler.txt
whatis quirks-handler >>./HelpMan/quirks-handler.txt
quirks-handler --help >>./HelpMan/quirks-handler.txt
man quirks-handler >>./HelpMan/quirks-handler.txt
