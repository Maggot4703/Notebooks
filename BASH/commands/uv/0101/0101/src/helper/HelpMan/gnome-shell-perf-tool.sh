#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-shell-perf-tool.txt
which gnome-shell-perf-tool >>./HelpMan/gnome-shell-perf-tool.txt
whatis gnome-shell-perf-tool >>./HelpMan/gnome-shell-perf-tool.txt
gnome-shell-perf-tool --help >>./HelpMan/gnome-shell-perf-tool.txt
man gnome-shell-perf-tool >>./HelpMan/gnome-shell-perf-tool.txt
