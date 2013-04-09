TEST NUMBER:     5.2.6


TITLE:           Timers


SUBTITLE:        T12 and T13: failure to receive a BLA


PURPOSE:         To verify that appropriate actions take place at the expiry of timers T12 and T13


REFERENCES:      Q.767: D.2.10.4/Q.767                               ISUP’92: 2.9.4/Q.764


PRE-TEST CONDITIONS:      Arrange the data in SP B such that a blocking acknowledgement message is not returned in response to a blocking message




Note : For running this test source code have been modified :

Comment : 

        transmitMessage(new SS7MsgISUP(SS7MsgISUP::BLA,msg->cic()),label,true);

In 
	case SS7MsgISUP::BLK: // Blocking
