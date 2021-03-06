#!/bin/bash

# Script variables
STAMP=`date -u '+%F-%T'`
TIME=${TIME:-620}
RHGW=root@212.85.130.91


mkdir $STAMP
cd $STAMP

# MTP3 capture
#	 ( ssh $RHGW "(sleep $TIME; echo) | wanpipemon -i w1g1 -pcap -pcap_file w1g1-mtp3.pcap -mtp2-msu -prot MTP2 -full -systime -c trd"; scp  $RHGW:w1g1-mtp3.pcap .; )&
#sleep 5
echo block
# Blocking circuit
ssh root@212.85.130.91 "echo -e \"control isup1/ISUP block circuit=2\nquit\" | nc localhost 5038"
wait 20
echo unblock
#Unblocking circuit
ssh root@212.85.130.91 "echo -e \"control isup1/ISUP unblock circuit=2\nquit\" | nc localhost 5038"
