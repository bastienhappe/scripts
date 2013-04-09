TEST NUMBER:     5.2.9


TITLE:           Timers


SUBTITLE:        T18 and T19: failure to receive a CGBA


PURPOSE:         To verify that appropriate actions take place at the expiry of timers T18 and T19


REFERENCES:      Q.767: D.2.10.4/Q.767                              ISUP’92: 2.9.4/Q.764


PRE-TEST CONDITIONS:      Arrange the data in SP B such that a circuit group blocking acknowledgement message
                          is not returned in response to a circuit group blocking message


Note : For running this test source code have been modified :

Change : 

        case SS7MsgISUP::CGB: // Circuit Group Blocking
        case SS7MsgISUP::CGU: // Circuit Group Unblocking
To :    
     
	case SS7MsgISUP::CGB: // Circuit Group Blocking
	break;
        case SS7MsgISUP::CGU: // Circuit Group Unblocking

