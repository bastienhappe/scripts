Note : For running this test source code have been modified :

Change : 

        case SS7MsgISUP::CGB: // Circuit Group Blocking
        case SS7MsgISUP::CGU: // Circuit Group Unblocking
To :    
     
	case SS7MsgISUP::CGB: // Circuit Group Blocking
	break;
        case SS7MsgISUP::CGU: // Circuit Group Unblocking

