#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/linux-boot-prober.txt
which linux-boot-prober >>./HelpMan/linux-boot-prober.txt
whatis linux-boot-prober >>./HelpMan/linux-boot-prober.txt
linux-boot-prober --help >>./HelpMan/linux-boot-prober.txt
man linux-boot-prober >>./HelpMan/linux-boot-prober.txt
