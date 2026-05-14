#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/vim.tiny.txt
which vim.tiny >>./HelpMan/vim.tiny.txt
whatis vim.tiny >>./HelpMan/vim.tiny.txt
vim.tiny --help >>./HelpMan/vim.tiny.txt
man vim.tiny >>./HelpMan/vim.tiny.txt
