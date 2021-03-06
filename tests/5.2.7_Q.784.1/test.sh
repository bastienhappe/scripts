#!/bin/bash

# Script variables
RHGW=root@212.85.130.91



# MTP3 capture
#	 ( ssh $RHGW "(sleep $TIME; echo) | wanpipemon -i w1g1 -pcap -pcap_file w1g1-mtp3.pcap -mtp2-msu -prot MTP2 -full -systime -c trd"; scp  $RHGW:w1g1-mtp3.pcap .; )&
#sleep 5
echo block
# Blocking circuit
ssh root@212.85.130.90 "echo -e \"control isup1/ISUP block circuit=2\nquit\" | nc localhost 5038"
echo unblock
#Unblocking circuit
ssh root@212.85.130.90 "echo -e \"control isup1/ISUP unblock circuit=2\nquit\" | nc localhost 5038"
