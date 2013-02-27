<<<<<<< HEAD
In this directory we create one sub-directory per SPIROU test scenario.
Each sub-directory contains a script called 'run.sh' which starts the instrumentation (`sipp` on test server, `dumpcap` for MTP2, MTP3, and audio CIC on the SS7 gateway).

The test environment is:

    lh-sipp --- lh-gw --- (isup) --- rh-gw --- (ccnq3) --- rh-sipp

where:

    lh-sipp: left-hand sipp
    lh-gw: left-hand gateway (simulating other carrier)
    rh-gw: right-hand gateway (our gateway, the Unit Under Test)
    rh-sipp: right-hand sipp (simulating one of our customers)

`run.sh` will gather test data from its environment, especially:
* LHSIPP: the name of the left-hand SS7 gateway;
* RHSIPP: the name of the right-hand SIP server;
* RHGW: the name of the the rh-gw; this argument is used to ssh to the server to start dumpcap.

Normally the script `run.sh` should simply contain:

    #!/bin/bash
    exec ../run.sh.template "$@"

The test directory is layoud as follows:

    /tests
      /submit.sh
      /test-XYZ
        /run.sh
        /rh-setup.xml
        /rh-start.xml
        /lh-setup.xml
        /rh-setup.xml

The XML scripts are executed in the order listed above, with the following intent:

* rh-setup, lh-setup: any pre-call setup steps (for example, REGISTER)
* rh-start: start the right-hand call scenario (normally, wait for INVITE in an inbound scenario)
* lh-start: start the left-hand call scenario
=======
CCNQ3 SS7 (Yate) SPIROU Test Suite
==================================

This project documents tests conducted with the goal of obtaining SPIROU (French national SS7 variant) certification.

This project is financed in part by [kwaoo.com](http://kwaoo.com/).
It uses an [expanded version](https://github.com/shimaore/yate/tree/master+shimaore) of Yate.
>>>>>>> 1df80701990c0f2cf8f08d788b13a34d0004fdcd
