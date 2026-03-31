#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gdmflexiserver.txt
which gdmflexiserver >>./HelpMan/gdmflexiserver.txt
whatis gdmflexiserver >>./HelpMan/gdmflexiserver.txt
gdmflexiserver --help >>./HelpMan/gdmflexiserver.txt
man gdmflexiserver >>./HelpMan/gdmflexiserver.txt
