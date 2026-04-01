#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/journalctl.txt
which journalctl >>./HelpMan/journalctl.txt
whatis journalctl >>./HelpMan/journalctl.txt
journalctl --help >>./HelpMan/journalctl.txt
man journalctl >>./HelpMan/journalctl.txt
