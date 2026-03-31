#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/acpi_listen.txt
which acpi_listen >>./HelpMan/acpi_listen.txt
whatis acpi_listen >>./HelpMan/acpi_listen.txt
acpi_listen --help >>./HelpMan/acpi_listen.txt
man acpi_listen >>./HelpMan/acpi_listen.txt
