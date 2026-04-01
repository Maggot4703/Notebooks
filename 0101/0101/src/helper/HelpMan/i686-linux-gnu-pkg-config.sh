#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/i686-linux-gnu-pkg-config.txt
which i686-linux-gnu-pkg-config >>./HelpMan/i686-linux-gnu-pkg-config.txt
whatis i686-linux-gnu-pkg-config >>./HelpMan/i686-linux-gnu-pkg-config.txt
i686-linux-gnu-pkg-config --help >>./HelpMan/i686-linux-gnu-pkg-config.txt
man i686-linux-gnu-pkg-config >>./HelpMan/i686-linux-gnu-pkg-config.txt
