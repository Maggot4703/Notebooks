#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fsck.ext3.txt
which fsck.ext3 >>./HelpMan/fsck.ext3.txt
whatis fsck.ext3 >>./HelpMan/fsck.ext3.txt
fsck.ext3 --help >>./HelpMan/fsck.ext3.txt
man fsck.ext3 >>./HelpMan/fsck.ext3.txt
