TEST NUMBER:     2.3.4
TITLE:           Successful Call setup
SUBTITLE:        Call switched via a satellite
PURPOSE:         To verify the satellite indicator in the initial address message is correctly set
REFERENCES:      Q.767: D.2.1/Q.767                                 ISUP’92: 2.1/Q.764
PRE-TEST CONDITIONS:     The SP data is arranged such that the call is switched via satellite connection or
                         has a satellite connection already included in the path



Take care to have a route for sat in /etc/yate/regexroute.conf

Such as :
^sat\(97333.*\)$=sig/\1; trunk=isup1; callernumtype=national; callernumplan=non-ISDN; sig.LocationNumber=616020000; sig.LocationNumber.nature=national; sig.LocationNumber.restrict=restricted; sig.LocationNumber.screened=network-provided; sig.ForwardCallIndicators=non-isdn-orig,isup-path; callednumtype=national; callednumplan=non-ISDN; sig.NatureOfConnectionIndicators=1sat; isup.CallingPartyNumber.restrict=restricted

