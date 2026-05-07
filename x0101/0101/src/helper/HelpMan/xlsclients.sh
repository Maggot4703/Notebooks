#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xlsclients.txt
which xlsclients >>./HelpMan/xlsclients.txt
whatis xlsclients >>./HelpMan/xlsclients.txt
xlsclients --help >>./HelpMan/xlsclients.txt
man xlsclients >>./HelpMan/xlsclients.txt
