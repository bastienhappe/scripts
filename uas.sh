#!/bin/bash

/usr/local/bin/sipp -sf branchc.xml -trace_msg -trace_logs -nd -m 1 a.phone.kwaoo.net
/usr/local/bin/sipp -sf uas.xml -trace_msg -trace_logs -nd -m 1 -i 192.168.1.6
