#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lxd.check-kernel.txt
which lxd.check-kernel >>./HelpMan/lxd.check-kernel.txt
whatis lxd.check-kernel >>./HelpMan/lxd.check-kernel.txt
lxd.check-kernel --help >>./HelpMan/lxd.check-kernel.txt
man lxd.check-kernel >>./HelpMan/lxd.check-kernel.txt
