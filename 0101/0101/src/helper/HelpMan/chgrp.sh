#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/chgrp.txt
which chgrp >>./HelpMan/chgrp.txt
whatis chgrp >>./HelpMan/chgrp.txt
chgrp --help >>./HelpMan/chgrp.txt
man chgrp >>./HelpMan/chgrp.txt
