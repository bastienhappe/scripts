TEST NUMBER:     5.2.7

TITLE:           Timers

SUBTITLE:        T14 and T15: failure to receive a UBA

PURPOSE:         To verify that appropriate actions take place at the expiry of timers T14 and T15

REFERENCES:      Q.767: D.2.10.4/Q.767                             ISUP’92: 2.9.4/Q.764

PRE-TEST CONDITIONS:      Arrange the data in SP B such that an unblocking acknowledgement message is not returned in response to an unblocking message


Note : For running this test source code have been modified :

Comment :
 
 /*        if (blockCircuit(msg->cic(),false,true,false,true,true))
                        transmitMessage(new SS7MsgISUP(SS7MsgISUP::UBA,msg->cic()),label,true);
                 else
                        reason = "unknown-channel";*/

In 	case SS7MsgISUP::UBL: // Unblocking

 
