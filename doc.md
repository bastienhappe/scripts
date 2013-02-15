Mise en place de l'automatisation des appels 
================================

<dt> *Architecture de test* </dt>

Tel ---- SS7 GW2 <----------> SS7 GW1 <----> switch ---- Tel

La partie gauche à partir de la SS7 GW, représente le "coté FT", à droite notre architecture.
Sur les deux gateway, Yate est configuré.

<dt> Routage </dt>
La configuration de Yate pour le routage des appels est la suivante :

sur GW1 :

^\(97333.*\)$=sip/+33\1@178.250.20

Pour les numéros portés :
^90036\(.*\)$=sip/+33\1@178.250.20


sur GW2 :

^\(97333.*\)$=sig/\1;trunk=isup1

Pour les numéros portés :
^\(90036.*\)$=sig/\1;trunk=isup1

<dt> Utilisation de SIPp </dt>
*1ere phase : Registration*

/usr/local/bin/sipp -sf branchc.xml -trace_msg -trace_logs -nd -m 1 a.phone.kwaoo.net

Scenario de registration :
-------------------------


Envoi d'un premier Register : 

    <send retrans="500">
  
    <![CDATA[

      REGISTER sip:a.phone.kwaoo.net SIP/2.0
      Via: SIP/2.0/[transport] [local_ip]:[local_port];branch=[branch]
      From: ua1 <sip:0973330001@a.phone.kwaoo.net:[local_port]>;tag=[call_number]
      To: ua1 <sip:0973330001@a.phone.kwaoo.net:[local_port]>
      Call-ID: [call_id]
      CSeq: 1 REGISTER
      Contact: sip:0973330001@[local_ip]:[local_port]
      Content-Length: 0
      Expires: 3000

    ]]>
    </send>

 <recv response="100">
  </recv>
 <recv response="401" auth="true">
  </recv>
</pre>
Note : Enabling authentication is simple. When receiving a 401 (Unauthorized) or a 407 (Proxy Authentication Required), you must add auth="true" in the <recv> command to take the challenge into account.

-------------------------
Envoi d'un second register : 

	<send retrans="500">
    	<![CDATA[

      	REGISTER sip:a.phone.kwaoo.net SIP/2.0
    	Via: SIP/2.0/[transport] [local_ip]:[local_port];branch=[branch]
     	From: ua1 <sip:0973330001@a.phone.kwaoo.net:[local_port]>;tag=[call_number]
     	To: ua1 <sip:0973330001@a.phone.kwaoo.net:[local_port]>
     	Call-ID: [call_id]
    	CSeq: 2 REGISTER
     	[authentication username=0973330001 password=toto]
     	Contact: sip:0973330001@[local_ip]:[local_port]
     	Content-Length: 0
     	Expires: 3000

   	 ]]>
  	</send>

 	<recv response="100">
  	</recv>
-------------------------
Authentification réussie : 

<recv response="200">
</recv>



* 2eme phase : Mise en route du serveur *

/usr/local/bin/sipp -sf uas.xml -trace_msg -trace_logs -nd -m 1 -i 192.168.1.6

Attente d'un invite :
 <recv request="INVITE" crlf="true" rrs="true">
  </recv>

Note : Using rrs="true" and [routes] to keep Record-Route header set supplied by the operator.

Réponses :

	<send>
	<![CDATA[

      SIP/2.0 180 Ringing
      [last_Via:]
      [last_From:]
      [last_To:];tag=[call_number]
      [last_Call-ID:]
      [last_CSeq:]
      Contact: <sip:[server_ip]:[local_port];transport=[transport]>
      Content-Length: 0

    	]]>
	</send>
  	<recv request="ACK"
        optional="true"
        rtd="true"
        crlf="true">
  	</recv>
  	<recv request="BYE">
  	</recv>
  	<send>
    <![CDATA[

      SIP/2.0 200 OK
      [last_Via:]
      [routes]
      [last_From:]
      [last_To:]
      [last_Call-ID:]
      [last_CSeq:]
      Contact: <sip:[local_ip]:[local_port];transport=[transport]>
      Content-Length: 0

    ]]>
  	</send>



* 3eme phase : Passage de l'appel *

	<send retrans="500">
    	<![CDATA[

      	INVITE sip:[service]@[remote_ip]:[remote_port] SIP/2.0
      	Via: SIP/2.0/[transport] [local_ip]:[local_port];branch=[branch]
      	From: sipp <sip:322857383@[remote_ip]:[local_port]>;tag=[call_number]
      	To: sut <sip:[service]@[remote_ip]:[remote_port]>
      	Call-ID: [call_id]
      	CSeq: 1 INVITE
      	Contact: sip:sipp@[local_ip]:[local_port]
      	Max-Forwards: 70
      	Subject: Performance Test
      	Content-Type: application/sdp
      	Content-Length: [len]

      	v=0
      	o=user1 53655765 2353687637 IN IP[local_ip_type] [local_ip]
      	s=-
      	c=IN IP[media_ip_type] [media_ip]
      	t=0 0
      	m=audio [media_port] RTP/AVP 8
      	a=rtpmap:8 PCMA/8000

    	]]>
  	</send>

