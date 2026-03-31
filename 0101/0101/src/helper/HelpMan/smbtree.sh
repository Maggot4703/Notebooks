#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/smbtree.txt
which smbtree >>./HelpMan/smbtree.txt
whatis smbtree >>./HelpMan/smbtree.txt
smbtree --help >>./HelpMan/smbtree.txt
man smbtree >>./HelpMan/smbtree.txt
