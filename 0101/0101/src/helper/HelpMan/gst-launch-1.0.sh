#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gst-launch-1.0.txt
which gst-launch-1.0 >>./HelpMan/gst-launch-1.0.txt
whatis gst-launch-1.0 >>./HelpMan/gst-launch-1.0.txt
gst-launch-1.0 --help >>./HelpMan/gst-launch-1.0.txt
man gst-launch-1.0 >>./HelpMan/gst-launch-1.0.txt
