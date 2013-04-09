T7: waiting for ACM or CON
PURPOSE: To check that at the expiry of T7 the circuit will be released

PRE-TEST CONDITIONS: Arrange the data in SP B such that an address complete message is not returned to the call request


Note : For running this test source code have been modified :

Comment :
setTerminate(true,"service-not-implemented",0,isup()->location());
setTerminate(true,"bearer-cap-not-available",0,isup()->location());
setTerminate(true,"bearer-cap-not-available",0,isup()->location());

In 	case SS7MsgISUP::IAM:



