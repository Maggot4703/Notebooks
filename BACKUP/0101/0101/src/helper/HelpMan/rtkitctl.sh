#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rtkitctl.txt
which rtkitctl >>./HelpMan/rtkitctl.txt
whatis rtkitctl >>./HelpMan/rtkitctl.txt
rtkitctl --help >>./HelpMan/rtkitctl.txt
man rtkitctl >>./HelpMan/rtkitctl.txt
