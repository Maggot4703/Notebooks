#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/strace-log-merge.txt
which strace-log-merge >>./HelpMan/strace-log-merge.txt
whatis strace-log-merge >>./HelpMan/strace-log-merge.txt
strace-log-merge --help >>./HelpMan/strace-log-merge.txt
man strace-log-merge >>./HelpMan/strace-log-merge.txt
