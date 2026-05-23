#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/kwalletd5.txt
which kwalletd5 >>./HelpMan/kwalletd5.txt
whatis kwalletd5 >>./HelpMan/kwalletd5.txt
kwalletd5 --help >>./HelpMan/kwalletd5.txt
man kwalletd5 >>./HelpMan/kwalletd5.txt
