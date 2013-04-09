TEST NUMBER:     5.2.5

TITLE:           Timers

SUBTITLE:        T8: waiting for COT message if applicable

PURPOSE:         To verify that when the IAM indicates that the continuity check:
                 – is required; or
                 – is performed on the previous circuit, and the COT message is not received within T8, the connection is released by the incoming signalling point


PRE-TEST CONDITIONS:    Arrange the data in SP B such that:
                        a) the signalling information in the IAM indicates a continuity check has been performed
                            on a previous circuit or continuity check is required on this circuit.
                        b) it does not send a continuity message.

