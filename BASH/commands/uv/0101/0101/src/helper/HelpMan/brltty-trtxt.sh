#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/brltty-trtxt.txt
which brltty-trtxt >>./HelpMan/brltty-trtxt.txt
whatis brltty-trtxt >>./HelpMan/brltty-trtxt.txt
brltty-trtxt --help >>./HelpMan/brltty-trtxt.txt
man brltty-trtxt >>./HelpMan/brltty-trtxt.txt
