TIMERS
==================================


T1 

	15-60s 
	m_t1Interval
	libs/ysig/isup.cpp
	T1 is started when a REL is sent and canceled when a RLC is received. If T1 expires, REL is retransmitted.
	Test :		Q.784.1 :5.2.3
T2

	180s
	Test :
T3

	120s
	
	Test :
T4

	Test :
T5

	300-900s
	m_relTimer
	m_t5Interval
	libs/ysig/isup.cpp
	T5 is also started when a REL is sent, and is canceled when a RLC is received. T5 is a longer duration timer than T1 and is intended to provide a mechanism to recover a nonresponding circuit for which a release has been initiated. If T5 expires, a RSC is sent and REL is no longer sent for the nonresponding circuit. An indication of the problem is also given to the maintenance system.
	Test : 		Q784.1  5.2.3
T6
	
	Test : 		Q784.1 	5.2.4
T7

	20-30s
	ISUP_T7_MINVAL
	ISUP_T7_DEFVAL
	ISUP_T7_MAXVAL
	libs/ysig/isup.cpp:
	Also known as the network protection timer. T7 is started when an IAM is sent, and is canceled when an ACM is received. If T7 expires, the circuit is released.
	Test :		Q784.1	5.2.1

T8

	10-15s
	Started when an IAM is received with the Continuity Indicator bit set. The timer is stopped when the Continuity Message is received. If T8 expires, a REL is sent to the originating node.
	Test :		Q784.1 	5.2.4

T9

	90-120s
	m_t9Interval
	libs/ysig/isup.cpp
	Not used in ANSI networks. T9 is started when an ACM is received, and is canceled when an ANM is received. If T9 expires, the circuit is released. Although T9 is not specified for ANSI networks, answer timing is usually performed at the originating exchange to prevent circuits from being tied up for an excessive period of time when the destination does not answer.
	Test :		Q784.1 5.2.2		

T10

	4-6s
	Test :

T11

	15-20s	
	Test :

T12

	15-60s
	Test : 		Q784.1	5.2.6

T13

	300-900s
	Test : 		Q784.1	5.2.6
T14

	15-60s
	Test :		Q784.1	5.2.7

T15

	300-900s
	Test :		Q784.1	5.2.7

T16

	15-60s
	Test :		Q784.1	5.2.8

T17

	300-900
	Test :		Q784.1	5.2.8

T18

	15-60s
	Test : 		Q784.1 	5.2.9

T19

	300-900s
	Test : 		Q784.1 	5.2.9

T20

	15-60s
	Test : 		Q784.1	5.2.10

T21

	300-900
	Test : 		Q784.1	5.2.10

T22

	15-60s
	Test :		Q784.1	5.2.11

T23

	300-900s
	Test :		Q784.1	5.2.11

T24

	<2s
	Test :

T25

	1-10s
	Test :

T26

	60-180s
	Test :

T27

	240s
	ISUP_T27_MINVAL
	ISUP_T27_DEFVAL
	ISUP_T27_MAXVAL
	libs/ysig/isup.cpp
	Test :

T28

	10s
	Test :

T29

	300-600ms
	Test :

T30

	5-10s
	Test :

T31

	> 360s
	Test :

T32

	3-5s
	Test :

T33

	12-15s
	Test :

T34

	2-4s
	ISUP_T34_MINVAL
	ISUP_T34_DEFVAL
	ISUP_T34_MAXVAL
	libs/ysig/isup.cpp

T35

	15-20s

T36

	10-15s

T37

	2-4s

T38
	
T39
