#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gulp.txt
which gulp >>./HelpMan/gulp.txt
whatis gulp >>./HelpMan/gulp.txt
gulp --help >>./HelpMan/gulp.txt
man gulp >>./HelpMan/gulp.txt
