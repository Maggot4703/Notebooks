#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x-terminal-emulator.txt
which x-terminal-emulator >>./HelpMan/x-terminal-emulator.txt
whatis x-terminal-emulator >>./HelpMan/x-terminal-emulator.txt
x-terminal-emulator --help >>./HelpMan/x-terminal-emulator.txt
man x-terminal-emulator >>./HelpMan/x-terminal-emulator.txt
