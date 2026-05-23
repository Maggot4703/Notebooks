#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/unix_chkpwd.txt
which unix_chkpwd >>./HelpMan/unix_chkpwd.txt
whatis unix_chkpwd >>./HelpMan/unix_chkpwd.txt
unix_chkpwd --help >>./HelpMan/unix_chkpwd.txt
man unix_chkpwd >>./HelpMan/unix_chkpwd.txt
