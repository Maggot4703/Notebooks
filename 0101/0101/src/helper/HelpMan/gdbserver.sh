#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gdbserver.txt
which gdbserver >>./HelpMan/gdbserver.txt
whatis gdbserver >>./HelpMan/gdbserver.txt
gdbserver --help >>./HelpMan/gdbserver.txt
man gdbserver >>./HelpMan/gdbserver.txt
