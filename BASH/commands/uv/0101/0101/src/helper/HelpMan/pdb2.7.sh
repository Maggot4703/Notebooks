#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pdb2.7.txt
which pdb2.7 >>./HelpMan/pdb2.7.txt
whatis pdb2.7 >>./HelpMan/pdb2.7.txt
pdb2.7 --help >>./HelpMan/pdb2.7.txt
man pdb2.7 >>./HelpMan/pdb2.7.txt
