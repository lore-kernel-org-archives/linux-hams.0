From: Bob Brose N0QBJ <linuxhams@n0qbj-11.ampr.org>
Subject: Progress on PPC ax25 2.6 kernel problem
Date: 29 Sep 2005 05:11:21 -0000
Message-ID: <20050929051121.28669.qmail@kunk.qbjnet.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Ater inserting a bunch of printks in the ax25 code I found that there
is a problem in ax25_rcv() in ax25_in.c. (kernel 2.6.14-rc1)

The reason packets aren't passed to the IP layer is that
dp.lastrepeat on x86 is -1 and on PPC it's 255. So the code
that checks to see if the packet belongs to this machine fails
in more than one spot. Here is a chunk of code from line 217:

/*
*      Ours perhaps ?
*/
if (dp.lastrepeat + 1 < dp.ndigi)  /* Not yet digipeated completely */


It goes on to set a local var called mine based on the comparison. If 
mine is non-zero the code then goes on to look to see if the packet is
an ARP or IP but discards it mine is 0;

If I throw in a hack to force mine to 1, ax25 ip now works on PPC.

I'm not sure where this is getting messed up. It looks like I have to
trace back from ax25_addr_parse(). it sure looks like a math/endian problem.

Anyone with suggestions??

73,
Bob
