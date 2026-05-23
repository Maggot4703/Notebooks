#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gst-typefind-1.0.txt
which gst-typefind-1.0 >>./HelpMan/gst-typefind-1.0.txt
whatis gst-typefind-1.0 >>./HelpMan/gst-typefind-1.0.txt
gst-typefind-1.0 --help >>./HelpMan/gst-typefind-1.0.txt
man gst-typefind-1.0 >>./HelpMan/gst-typefind-1.0.txt
