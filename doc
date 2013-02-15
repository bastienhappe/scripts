

<dt> Architecture </dt>

Coté FT ---- SS7 GW2 <----------> SS7 GW1 <----> switch ---- Tel

<dt> Routage </dt>
La configuration de Yate pour le routage des appels est la suivante :

sur GW1 :
^\(97333.*\)$=sip/+33\1@178.250.20
^90036\(.*\)$=sip/+33\1@178.250.20
^\(322857383\)$=sig/\1;trunk=isup1

sur GW2 :
^\(97333.*\)$=sig/\1;trunk=isup1
^\(90036.*\)$=sig/\1;trunk=isup1

<dt> Utilisation de SIPp </dt>
<dt> Registration</dt>

/usr/local/bin/sipp -sf branchc.xml -trace_msg -trace_logs -nd -m 1 a.phone.kwaoo.net

Scenario de registration :
Envoi d'un Register 


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

reponses attendues :
 <recv response="100">
  </recv>
<recv response="200">
</recv>


* Mise en route du serveur

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

* Passage de l'appel
