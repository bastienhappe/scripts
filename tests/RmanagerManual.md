Rmanager allows controlling Yate using a simple telnet client.

Connexion :

telnet localhost 5038


=======
Commands :
==================================


Make a call :

call chan target
example : call tone/ring CALLEE_NUMBER

Release a call : 

control isup-trunk-name release circuit=number [reason=cause]
Release a Restart in progress or a call (normal or CCR) on a circuit

example : control isup1/ISUP release circuit=11


(Un)Block a circuit :

control isup-trunk-name block circuit=number [force=yes] [remote=yes] [hwfail=yes]
	Maintenance local block the specified circuit (ISUP BLK)
	Maintenance or failure remote block the specified circuit
control isup-trunk-name unblock circuit=number [force=yes] [remote=yes] [hwfail=yes]
	Maintenance local unblock the specified circuit (ISUP UBL)
	Maintenance or failure remote unblock the specified circuit

(Un)Block a group of circuits:

control isup-trunk-name block circuits=range [hwfail=yes] [force=yes] [remote=yes]
	Maintenance or failure local block the specified circuit group (ISUP CGB)
	Maintenance or failure remote block the specified circuit group
control isup-trunk-name unblock circuits=range [hwfail=yes] [force=yes] [remote=yes]
	Maintenance or failure local unblock the specified circuit group (ISUP CGU)

example : control isup1/ISUP block circuit=4

More informations :
[Rmanager_Commands](http://yate.null.ro/pmwiki/index.php?n=Main.RmanagerCommands)

[Ysigchan_Commands](http://yate.null.ro/pmwiki/index.php?n=Main.Ysigchan#commands)
