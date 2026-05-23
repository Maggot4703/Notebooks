#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-ld.bfd.txt
which x86_64-linux-gnu-ld.bfd >>./HelpMan/x86_64-linux-gnu-ld.bfd.txt
whatis x86_64-linux-gnu-ld.bfd >>./HelpMan/x86_64-linux-gnu-ld.bfd.txt
x86_64-linux-gnu-ld.bfd --help >>./HelpMan/x86_64-linux-gnu-ld.bfd.txt
man x86_64-linux-gnu-ld.bfd >>./HelpMan/x86_64-linux-gnu-ld.bfd.txt
