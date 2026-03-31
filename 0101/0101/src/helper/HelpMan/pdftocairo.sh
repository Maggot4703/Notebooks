#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pdftocairo.txt
which pdftocairo >>./HelpMan/pdftocairo.txt
whatis pdftocairo >>./HelpMan/pdftocairo.txt
pdftocairo --help >>./HelpMan/pdftocairo.txt
man pdftocairo >>./HelpMan/pdftocairo.txt
