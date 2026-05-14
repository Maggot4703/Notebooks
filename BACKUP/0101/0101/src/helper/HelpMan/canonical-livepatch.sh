#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/canonical-livepatch.txt
which canonical-livepatch >>./HelpMan/canonical-livepatch.txt
whatis canonical-livepatch >>./HelpMan/canonical-livepatch.txt
canonical-livepatch --help >>./HelpMan/canonical-livepatch.txt
man canonical-livepatch >>./HelpMan/canonical-livepatch.txt
