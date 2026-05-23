#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pam_extrausers_chkpwd.txt
which pam_extrausers_chkpwd >>./HelpMan/pam_extrausers_chkpwd.txt
whatis pam_extrausers_chkpwd >>./HelpMan/pam_extrausers_chkpwd.txt
pam_extrausers_chkpwd --help >>./HelpMan/pam_extrausers_chkpwd.txt
man pam_extrausers_chkpwd >>./HelpMan/pam_extrausers_chkpwd.txt
