From: "John Buttery" <john.buttery@btinternet.com>
Subject: RE: ax25/netrom/crashes?
Date: Mon, 4 Aug 2003 21:59:57 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <000301c35acb$5f8c5880$0a01a8c0@john>
References: <3F2EBD95.1060803@algonet.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3F2EBD95.1060803@algonet.se>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Kjell Jarl' <K-Jarl@algonet.se>, 'Linux Hams' <linux-hams@vger.kernel.org>

Hi

When I was using RedHat 7.2 I was having crashes once or twice a day.  The
majority of them were after a NetRom disconnect.  I have now reverted to Red
Hat 6.2 with Kernel 2.2.24 and my node (GB7WDX) has been up for 112 days.

73 de John, G7OPJ

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Kjell Jarl
Sent: 04 August 2003 21:10
To: Linux Hams
Subject: ax25/netrom/crashes?

Hi!
I am (still) struggling with crashes.

I now suspect, even more, netrom has to do with the crashes, latest hint 
is this:
 From /var/messages I can se one user logging in to dxspider who 
probably has come over so many 1200 bit/s nodes that it cannot pass the 
traffic fast enough, but a (netrom transport) queue is built up.
After 1,5 hour of connection, the node is crashing.

- Maybe due to filled up queue (not liekely)?
- Maybe due to a disconnect from the remote end with a large queue?

Below is the tail -f of the log file as seen over 1200 bit/s, including 
the disconnect after the crash:

Aug  4 19:18:24 router-sk7hw ax25d[2733]: NET/ROM SK6HD-0@SK7IJ-5 
(netrom) node
Aug  4 19:18:24 router-sk7hw node[2733]: SK6HD @ SK7IJ-5 logged in
Aug  4 19:19:08 router-sk7hw ax25d[2734]: NET/ROM SK6HD-0@SK7HW-5 
(netsp) client
Aug  4 19:19:08 router-sk7hw node[2733]: Connected to DXSVXO:SK7HW-7
*** Cleared
Mon Aug  4 20:59:17 CEST 2003
[sm7gvf@pc2 sm7gvf]$


kernel 2.4.22-pre10
HR6.1

Guessing here (the system is down):
libax25-devel-0.0.7
libax25-0.0.7
ax25-tools-0.0.6
ax25-apps-0.0.4

running dxnet, fbb, dxspider, node0.3.0

I am using the script below as startup, I don't have all the other files 
at hand here.

Could it be netrom causing this?

What more information could I supply?

73
Kjell, sm7gvf



