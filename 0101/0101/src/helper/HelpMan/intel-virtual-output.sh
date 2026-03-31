#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/intel-virtual-output.txt
which intel-virtual-output >>./HelpMan/intel-virtual-output.txt
whatis intel-virtual-output >>./HelpMan/intel-virtual-output.txt
intel-virtual-output --help >>./HelpMan/intel-virtual-output.txt
man intel-virtual-output >>./HelpMan/intel-virtual-output.txt
