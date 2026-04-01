#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/newgrp.txt
which newgrp >>./HelpMan/newgrp.txt
whatis newgrp >>./HelpMan/newgrp.txt
newgrp --help >>./HelpMan/newgrp.txt
man newgrp >>./HelpMan/newgrp.txt
