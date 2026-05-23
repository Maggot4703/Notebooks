#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fwupdagent.txt
which fwupdagent >>./HelpMan/fwupdagent.txt
whatis fwupdagent >>./HelpMan/fwupdagent.txt
fwupdagent --help >>./HelpMan/fwupdagent.txt
man fwupdagent >>./HelpMan/fwupdagent.txt
