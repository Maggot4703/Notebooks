#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ulockmgr_server.txt
which ulockmgr_server >>./HelpMan/ulockmgr_server.txt
whatis ulockmgr_server >>./HelpMan/ulockmgr_server.txt
ulockmgr_server --help >>./HelpMan/ulockmgr_server.txt
man ulockmgr_server >>./HelpMan/ulockmgr_server.txt
