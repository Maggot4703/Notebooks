#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ssh-keygen.txt
which ssh-keygen >>./HelpMan/ssh-keygen.txt
whatis ssh-keygen >>./HelpMan/ssh-keygen.txt
ssh-keygen --help >>./HelpMan/ssh-keygen.txt
man ssh-keygen >>./HelpMan/ssh-keygen.txt
