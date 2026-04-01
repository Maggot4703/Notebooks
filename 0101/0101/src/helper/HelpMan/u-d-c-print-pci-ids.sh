#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/u-d-c-print-pci-ids.txt
which u-d-c-print-pci-ids >>./HelpMan/u-d-c-print-pci-ids.txt
whatis u-d-c-print-pci-ids >>./HelpMan/u-d-c-print-pci-ids.txt
u-d-c-print-pci-ids --help >>./HelpMan/u-d-c-print-pci-ids.txt
man u-d-c-print-pci-ids >>./HelpMan/u-d-c-print-pci-ids.txt
