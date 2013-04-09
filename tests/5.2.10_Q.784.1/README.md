TEST NUMBER:     5.2.10


TITLE:           Timers


SUBTITLE:        T20 and T21: failure to receive a CGUA


PURPOSE:         To verify that appropriate actions take place the expiry of timers T20 and T21


REFERENCES:      Q.767 : D.2.10.4/Q.767                            ISUP’92: 2.9.4/Q.764


PRE-TEST CONDITIONS:      Arrange the data in SP B such that a circuit group unblocking acknowledgement message is not returned in response to a circuit group unblocking message



Note : For running this test source code have been modified :

Change : 

case SS7MsgISUP::CGB: // Circuit Group Blocking
case SS7MsgISUP::CGU: // Circuit Group Unblocking
            // Q.763 3.43 range can be 1..256. Max bits set to 1 should be 32
            // Bit: 0-no indication 1-block/unblock
            {
                bool hwFail = false;
                if (!getGrpTypeInd(this,msg,hwFail))
                    break;
                bool block = (msg->type() == SS7MsgISUP::CGB);
                String* srcMap = 0;
                unsigned int nCics = getRangeAndStatus(msg->params(),1,256,256,&srcMap,32);
                if (!nCics) {
                    Debug(this,DebugNote,"%s with invalid range %s or map=%s",msg->name(),
                        msg->params().getValue(YSTRING("RangeAndStatus")),
                        msg->params().getValue(YSTRING("RangeAndStatus.map")));
                    break;
                }
                else if (nCics == 1 && ((block && m_ignoreCGBSingle) || (!block && m_ignoreCGUSingle))) {
                    Debug(this,DebugAll,"Ignoring %s with range 1",msg->name());
                    break;
                }
                String map('0',srcMap->length());
                char* d = (char*)map.c_str();
                for (unsigned int i = 0; i < srcMap->length(); i++)
                    if (srcMap->at(i) != '0' && blockCircuit(msg->cic()+i,block,true,hwFail,true,true))
                        d[i] = '1';
                SS7MsgISUP* m = new SS7MsgISUP(block?SS7MsgISUP::CGA:SS7MsgISUP::CUA,msg->cic());
                m->params().copyParam(msg->params(),"GroupSupervisionTypeIndicator");
                m->params().addParam("RangeAndStatus",String(nCics));
                m->params().addParam("RangeAndStatus.map",map);
                transmitMessage(m,label,true);
                // Replace circuits for outgoing calls in initial state
                // Terminate all others when blocking for hw failure
                if (block) {
                    if (hwFail)
                        cicHwBlocked(msg->cic(),map);
                    else
                        replaceCircuit(msg->cic(),map);
                }
            }
break;

To :    

case SS7MsgISUP::CGB: // Circuit Group Blocking
            // Q.763 3.43 range can be 1..256. Max bits set to 1 should be 32
            // Bit: 0-no indication 1-block/unblock
            {
                bool hwFail = false;
                if (!getGrpTypeInd(this,msg,hwFail))
                    break;
                bool block = (msg->type() == SS7MsgISUP::CGB);
                String* srcMap = 0;
                unsigned int nCics = getRangeAndStatus(msg->params(),1,256,256,&srcMap,32);
                if (!nCics) {
                    Debug(this,DebugNote,"%s with invalid range %s or map=%s",msg->name(),
                        msg->params().getValue(YSTRING("RangeAndStatus")),
                        msg->params().getValue(YSTRING("RangeAndStatus.map")));
                    break;
                }
                else if (nCics == 1 && ((block && m_ignoreCGBSingle) || (!block && m_ignoreCGUSingle))) {
                    Debug(this,DebugAll,"Ignoring %s with range 1",msg->name());
                    break;
                }
                String map('0',srcMap->length());
                char* d = (char*)map.c_str();
                for (unsigned int i = 0; i < srcMap->length(); i++)
                    if (srcMap->at(i) != '0' && blockCircuit(msg->cic()+i,block,true,hwFail,true,true))
                        d[i] = '1';
                SS7MsgISUP* m = new SS7MsgISUP(block?SS7MsgISUP::CGA:SS7MsgISUP::CUA,msg->cic());
                m->params().copyParam(msg->params(),"GroupSupervisionTypeIndicator");
                m->params().addParam("RangeAndStatus",String(nCics));
                m->params().addParam("RangeAndStatus.map",map);
                transmitMessage(m,label,true);
                // Replace circuits for outgoing calls in initial state
                // Terminate all others when blocking for hw failure
                if (block) {
                    if (hwFail)
                        cicHwBlocked(msg->cic(),map);
                    else
                        replaceCircuit(msg->cic(),map);
                }
            }
break;
 case SS7MsgISUP::CGU: // Circuit Group Unblocking
break;

     
	case SS7MsgISUP::CGB: // Circuit Group Blocking
	break;
        case SS7MsgISUP::CGU: // Circuit Group Unblocking

