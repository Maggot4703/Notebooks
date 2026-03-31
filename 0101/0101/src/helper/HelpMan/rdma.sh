#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rdma.txt
which rdma >>./HelpMan/rdma.txt
whatis rdma >>./HelpMan/rdma.txt
rdma --help >>./HelpMan/rdma.txt
man rdma >>./HelpMan/rdma.txt
