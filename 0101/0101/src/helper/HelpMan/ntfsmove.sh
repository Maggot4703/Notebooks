#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ntfsmove.txt
which ntfsmove >>./HelpMan/ntfsmove.txt
whatis ntfsmove >>./HelpMan/ntfsmove.txt
ntfsmove --help >>./HelpMan/ntfsmove.txt
man ntfsmove >>./HelpMan/ntfsmove.txt
