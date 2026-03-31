#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pam_tally2.txt
which pam_tally2 >>./HelpMan/pam_tally2.txt
whatis pam_tally2 >>./HelpMan/pam_tally2.txt
pam_tally2 --help >>./HelpMan/pam_tally2.txt
man pam_tally2 >>./HelpMan/pam_tally2.txt
