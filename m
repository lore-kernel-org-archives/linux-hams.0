From: "Gunnar Widell (ESE)" <Gunnar.Widell@ese.ericsson.se>
Subject: ax25/baycom/kernel(?) problem.
Date: Mon, 24 Mar 2003 10:22:07 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1F55F6582266314A85A55F6241509B670395F453@Esealnt863.al.sw.ericsson.se>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-hams@vger.kernel.org'" <linux-hams@vger.kernel.org>

A couple of weeks ago a described a DCD problem with my Baycom ser12 modem.
Got several answers (thanks) and I was able to solve the problem by adjusting the TCM3105 modem, the "2.6 volt something" on one of the pins.
I used the sethdlc -d command to debug on RX signals... and was able to get the DCD much more stable.

BUT!
Now I have problems with my modem not responding or send any ax25 packets after acouple of hours, up to a day, of operation.
I can see incoming calls (listen -cart) on the channel to my station, but no answer. If I try to make a call myself (call -r bcsf0 sl0zs) the modem does not send anything.

If I then try to unload the baycom driver and start it again all seams to be ok again.
Sometimes when I try to unload it, I get a KERNEL PANIC (something with interupt) and I need to power off my computer.

I have tried several things, thinking this is a kernel problem, tried to compile a 2.4.20 kernel, instead of the 2.4.18-3 I have been running.
I see the same thing... I have tried to load ax25 as module but same result.

My setup is a Pentium 500MHZ with 128 MB and 2.4.18-3 kernel. Rigth now 2.4.20 kernel with same problem.
Will try to compile a 2.4.10 kernel today and see if I get the same problem. Also running IPTables with NAT...

Baycom_ser_fdx 1200 bd modem. DX-spider. NO NODE or IP over radio yet...

Where to continue? No I need to go to a 2.2 kernel or could it still be a configuration problem?
What else can I print to see status of my ax25? The printouts below does not give ME any useful information, but maybe to someone else.
During this printouts I do not see any call attempts on my "listen -cart".

[sm3sgp@c213-100-160-63 sm3sgp]$ call -r bcsf0 sl0zs
GW4PTS AX.25 Connect v1.11
Trying...

[root@c213-100-160-63 linux-2.4.10]# cat /proc/net/ax25
c40ba5e0 bcsf0 SM3SGP-0 SL0ZS-0 1 0 0 0 3 10 0 4 0 3000 0 0 5 15 5 4 256 0 0 13394
c7f97760 bcsf0 SM3SGP-10 * 0 0 0 0 0 10 0 4 0 3000 0 0 0 15 5 4 256 0 0 937
c7f97b60 bcsf0 SM3SGP-6 * 0 0 0 0 0 10 0 4 0 3000 0 0 0 15 5 4 256 0 0 935
[root@c213-100-160-63 linux-2.4.10]#

netstat
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
SL0ZS-0    SM3SGP-0   bcsf0   SABM SENT    000/000  0       0
*          SM3SGP-10  bcsf0   LISTENING    000/000  0       0
*          SM3SGP-6   bcsf0   LISTENING    000/000  0       0
[root@c213-100-160-63 linux-2.4.10]#

73 de Gus, SM3SGP

telnet sk3w.shacknet.nu 8000 DX-spider

