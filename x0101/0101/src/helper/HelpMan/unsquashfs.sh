#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/unsquashfs.txt
which unsquashfs >>./HelpMan/unsquashfs.txt
whatis unsquashfs >>./HelpMan/unsquashfs.txt
unsquashfs --help >>./HelpMan/unsquashfs.txt
man unsquashfs >>./HelpMan/unsquashfs.txt
