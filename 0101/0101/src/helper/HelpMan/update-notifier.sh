#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/update-notifier.txt
which update-notifier >>./HelpMan/update-notifier.txt
whatis update-notifier >>./HelpMan/update-notifier.txt
update-notifier --help >>./HelpMan/update-notifier.txt
man update-notifier >>./HelpMan/update-notifier.txt
