#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/aa-exec.txt
which aa-exec >>./HelpMan/aa-exec.txt
whatis aa-exec >>./HelpMan/aa-exec.txt
aa-exec --help >>./HelpMan/aa-exec.txt
man aa-exec >>./HelpMan/aa-exec.txt
