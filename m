From: "Wilbert Knol" <w.knol@niwa.cri.nz>
Subject: FETCHMAIL over AX25?
Date: Wed, 1 May 2002 10:41:35 +1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3CCFC65F.13679.2E7BEDD9@localhost>
Reply-To: w.knol@niwa.cri.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Thanks for reading this. At home, I get my E-mail via packet radio from a 
remote POP3 host with the fetchmail client. It's done with TCP/IP over 
AX25.

The POP3 server hangs off a (remote) XROUTER node, on a LAN, and I 
am using that node as my gateway to the POP3 mail host.

The TCP/IP doesn't seem to work particularly well over this path, which is 
a combination of 1k2 AX25 and Ethernet. I have done some extensive 
tweaking at my end, and I have finally decided it's a lost cause.

The plan now is, to open a plain AX25 session to the XROUTER node, 
and, from there, telnet straight into the POP3 server. 

Fetchmail allows the use of a 'plugin', and I have played with various 
Expect scripts, and also with the call program, to try and present 
Fetchmail with an open connection to the POP3 server.

The trouble is, that fetchmail doesn't like the link status messages that the 
call program throws up. As soon as it gets to see anything other than a 
valid POP3 prompt, it aborts the operation.

I have butchered the call.c code with some degree of success to stop it 
from writing to STDOUT until it sees the "+OK" from the POP3 server.

But I am having trouble faking the "telnet <pop3host> 110" command. 
The call.c code waits for a keyboard hit before it sends the hard-coded 
"telnet" string, which never comes.

I was wondering if anyone else has managed to do this, or has 
suggestions on how to go about it.

Wilbert, ZL2BSJ

