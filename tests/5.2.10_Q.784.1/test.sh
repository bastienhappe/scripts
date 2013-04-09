#!/bin/bash

# Script variables
RHGW=root@212.85.130.91



sleep 5
ssh root@212.85.130.90 "echo -e \"control isup1/ISUP block circuits=2-3\nquit\" | nc localhost 5038"
ssh root@212.85.130.90 "echo -e \"control isup1/ISUP unblock circuits=2-3\nquit\" | nc localhost 5038"
