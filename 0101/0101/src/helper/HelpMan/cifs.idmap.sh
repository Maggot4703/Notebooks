#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cifs.idmap.txt
which cifs.idmap >>./HelpMan/cifs.idmap.txt
whatis cifs.idmap >>./HelpMan/cifs.idmap.txt
cifs.idmap --help >>./HelpMan/cifs.idmap.txt
man cifs.idmap >>./HelpMan/cifs.idmap.txt
