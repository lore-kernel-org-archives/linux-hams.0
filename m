From: Mike Markowski <mm@UDel.Edu>
Subject: FlexNet connect
Date: Sun, 29 Feb 2004 17:47:18 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040229224718.GA15835@strauss.udel.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

I had begun sprinkling printfs throughout soundmodem-0.7
and it occurred to me that maybe someone has run into this
little problem:

There are several FlexNet nodes near me and I can't connect
to any.  I type, for example, "call radio W3EOC-2" and see
soundmodem send out the SABM+.  Immediately after, I hear a
long packet returned by the FlexNet node but soundmodem
prints nothing.  The other node then begins sending RR0+
packets.  Each time my station sends another SABM+, I hear
a long packet but again soundmodem doesn't even decode it.

On one occasion, by a lucky collision on the channel, soundmodem
did print out a portion of the packet: "Enter your first name:"
followed by more RR0+ pkts from the FlexNet node.  So the FlexNet
node thinks we're connected and begins waiting for data, but my
node is still trying to connect.

It seems that my ax.25 set up is probably expecting a different
sort of protocol exchanges than it's seeing.  Does anyone have
any idea what is happening?  If not, back to the printfs!  :-)

	Thanks,
	Mike  AB3AP
