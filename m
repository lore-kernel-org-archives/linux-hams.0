From: Mike Markowski <mm@UDel.Edu>
Subject: PTT with soundmodem
Date: Sun, 1 Feb 2004 16:55:30 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040201215530.GA572@strauss.udel.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

Hi all,

I'm thiiis close to having my packet set up working in kernel 2.4.24
(currently unpatched).  I'm using the user space soundmodem to create
interface ax0 -- so I assume I don't need to do a kissattach.  When I
use soundmodemconfig to test the setup, I can successfully use the
PTT gui button to get my rig to transmit (and also have no problem
with PTT when using Tomi's great gMFSK!).  However, while i can
receive APRS packets while running xastir, when it tries to transmit,
soundmodem complains after the xastir info:

   Tx: fm AB3AP-0 to APX121-0 via RELAY-0,WIDE-0 UI^ pid=F0
   =/:B7_;?z&y ab3ap@arrl.net, Avondale PA (XASTIR-Linux)
 
   sm[15891]: ioctl: SNDCTL_DSP_SYNC: Device or resource busy (16)

I see the LED on my PTT interface briefly light, but not long
enough to activate the rig itself before the error above is
printed.

I use the same HW addr (AB3AP-1) in my soundmodem.conf as in my
/etc/ax25/axports file.  Anyone spot what I'm doing wrong?  I haven't
included any .conf files since I'm not at that machine now and am
hoping the above description is enough to indicate my mistake, but
I'll be happy to go get those if needed.  Thanks for any ideas!

Mike  AB3AP
