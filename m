From: Jarmo <oh1mrr@nic.fi>
Subject: Stange behavior
Date: Mon, 26 Jan 2004 18:35:34 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200401261835.34771.oh1mrr@nic.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi
We have found very strange behavior of ax25/netrom with
2.4.x and 2.6.x kernels.

First setup contains BBS F6FBB 7.04j,cluster DXSPIDER 1.51 and
node with 4 radio ports and 1 ethernet port.
libax25-0.0.11
ax25-apps-0.0.6
ax25-tools-0.0.8
node-0.3.2

Ax ports uses 6pack.

Now when using kernel 2.4.x if coming to node using telnet,connection
from some reason fails forinstance to bbs,node after timeout try disconnect
telnet connection.Everything seems to go ok,but actually connection never 
breaks.
Now other bbs waits,say 5 minutes and tries to connect again,same happens..
and so and so...Soon we have huge number connections in node sending
DM- packets and eating up system resources until all hangs...kernel panic..

This does not happen using ax25 protocol...

When using 2.6.x series kernel situation is totally opposite!

Kernels tested here 2.4.22 23 24 25-pre6
                               2.6.0 (fbb didn't work)
                                2.6.1 (fbb didn't work)
				2.6.2-rc1 (fbb didn't work)

In 2.6 series FBB does not work...Every thing goes up without any
complain,no errors.It really starts,but connection into fbb just hangs.
When connecting into fbb we get connected to OH1RBF and that's all...
No command can be altered...We stay connected there for ever,unless
somebody kills the pid,or too many connections...Kernel Panic!

Read somewhere that we should use 2.2 series kernels...Ok...tested
latest 2.2.25 but can't get it installed...;-) too new distro propably?
Mandrake 9.2...Too much compile etc..errors.Compiler is 3.3.1...

Hardware tested amdk6-2 400 390M ram 15G hd...
466 celeron 256 ram 13G hd...
amd duron 800 390 15G...Not long,MB kaboom;-)

So seems that at the moment we are in deep swamp...

OH...Forgot almost...We tested also 2.4.23 and 24 kernels with 9a4gl
patch...Got all up,but when connected to node from home
using plain ax25 got connected,but that was all...no  commands
worked ..Then after timeout node kicked
out,BUT left connection pid living and eating resources.

Anyone else got similar?

Now best usable is 2.4.25-pre6 intelnet disabled.Still every now and then
kernel panic...
Could it be from 6pack.We are getting 6pack:Bad checksum xx,where xx
is some hex number.

Are we in troubles...?;-)

As said,no particular error messages or similar in any logs found..
"kernel picnic";-) says allways that lost interrupt handler Aieeee!

As known that message can't be read from any log,especially when
we don't have any debugging set on...And my knowledge is still
limited after 6 years using LIN.

At my home MDK9.2 with 2.6.2-rc1 kernel works OK...
1 radioport out using 6pack...Only few "bad checksum" messages..

Again...Someone familiar with this...Any succestions so far...Yes sure
much questions...Shoot...

73 de Jarmo
oh1mrr

