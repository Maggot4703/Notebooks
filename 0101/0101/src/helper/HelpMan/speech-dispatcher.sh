#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/speech-dispatcher.txt
which speech-dispatcher >>./HelpMan/speech-dispatcher.txt
whatis speech-dispatcher >>./HelpMan/speech-dispatcher.txt
speech-dispatcher --help >>./HelpMan/speech-dispatcher.txt
man speech-dispatcher >>./HelpMan/speech-dispatcher.txt
