#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dpkg-mergechangelogs.txt
which dpkg-mergechangelogs >>./HelpMan/dpkg-mergechangelogs.txt
whatis dpkg-mergechangelogs >>./HelpMan/dpkg-mergechangelogs.txt
dpkg-mergechangelogs --help >>./HelpMan/dpkg-mergechangelogs.txt
man dpkg-mergechangelogs >>./HelpMan/dpkg-mergechangelogs.txt
