#!/bin/bash

# Script variables
STAMP=`date -u '+%F-%T'`
TIME=${TIME:-620}
RHGW=root@212.85.130.91


mkdir $STAMP
cd $STAMP

# MTP3 capture
	 ( ssh $RHGW "(sleep $TIME; echo) | wanpipemon -i w1g1 -pcap -pcap_file w1g1-mtp3.pcap -mtp2-msu -prot MTP2 -full -systime -c trd"; scp  $RHGW:w1g1-mtp3.pcap .; )&
sleep 5
ssh root@212.85.130.90 "echo -e \"control isup1/ISUP block circuits=2-3\nquit\" | nc localhost 5038"
