#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/udisksctl.txt
which udisksctl >>./HelpMan/udisksctl.txt
whatis udisksctl >>./HelpMan/udisksctl.txt
udisksctl --help >>./HelpMan/udisksctl.txt
man udisksctl >>./HelpMan/udisksctl.txt
