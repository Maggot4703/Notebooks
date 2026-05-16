#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mount.cifs.txt
which mount.cifs >>./HelpMan/mount.cifs.txt
whatis mount.cifs >>./HelpMan/mount.cifs.txt
mount.cifs --help >>./HelpMan/mount.cifs.txt
man mount.cifs >>./HelpMan/mount.cifs.txt
