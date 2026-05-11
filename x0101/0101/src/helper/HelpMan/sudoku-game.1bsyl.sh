#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sudoku-game.1bsyl.txt
which sudoku-game.1bsyl >>./HelpMan/sudoku-game.1bsyl.txt
whatis sudoku-game.1bsyl >>./HelpMan/sudoku-game.1bsyl.txt
sudoku-game.1bsyl --help >>./HelpMan/sudoku-game.1bsyl.txt
man sudoku-game.1bsyl >>./HelpMan/sudoku-game.1bsyl.txt
