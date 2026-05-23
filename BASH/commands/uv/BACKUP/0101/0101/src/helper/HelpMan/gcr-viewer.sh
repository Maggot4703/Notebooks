#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gcr-viewer.txt
which gcr-viewer >>./HelpMan/gcr-viewer.txt
whatis gcr-viewer >>./HelpMan/gcr-viewer.txt
gcr-viewer --help >>./HelpMan/gcr-viewer.txt
man gcr-viewer >>./HelpMan/gcr-viewer.txt
