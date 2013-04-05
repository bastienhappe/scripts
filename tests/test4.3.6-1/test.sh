#!/bin/bash

# Script variables
STAMP=`date -u '+%F-%T'`
TIME=${TIME:-620}
RHGW=root@212.85.130.91

sleep 5

# MTP3 capture
#	 ( ssh $RHGW "(sleep $TIME; echo) | wanpipemon -i w1g1 -pcap -pcap_file w1g1-mtp3.pcap -mtp2-msu -prot MTP2 -full -systime -c trd"; scp  $RHGW:w1g1-mtp3.pcap .; )&
ssh root@212.85.130.91 "echo -e \"control isup1/ISUP parttest circuit=1\nquit\" | nc localhost 5038"
