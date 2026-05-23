#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/logsave.txt
which logsave >>./HelpMan/logsave.txt
whatis logsave >>./HelpMan/logsave.txt
logsave --help >>./HelpMan/logsave.txt
man logsave >>./HelpMan/logsave.txt
