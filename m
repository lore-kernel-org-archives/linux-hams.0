From: Chris Kantarjiev <cak@dimebank.com>
Subject: net2kiss and ptys
Date: Wed, 18 Jul 2007 14:13:02 -0700 (PDT)
Message-ID: <200707182113.l6ILD2UC000442@moose.dimebank.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

I'm slowly figuring out ax25 and linux, having done neither before.
My motivation is trying to build a digipeater/igate on OpenWRT -
the hardware is cheap and reliable and runs on a minimal 12V
supply, so it's pretty much ideal, once you add a serial port.

I've got the hardware, I've got a kernel with ax25, I've got a KISS
TNC, I've got versions of digi_ned and aprsd. The trick is plumbing
them together.

I don't have a toolchain for creating binaries for the WRT. :-(

The hard part is that neither the digi_ned nor aprsd have ax25 port
support - they've both been cut down to run on the device. That's
OK - I can use kissattach to talk to the TNC, and net2kiss to do
the plumbing to make ptys with the packets for both programs.

Or so I thought.

The problem is the ptys. The OpenWRT uses "Unix98" naming of ptys,
where one opens /dev/ptmx to get a pair of file descriptors that
are connected. net2kiss believes that ptys are pre-created and
that the invoker can grab a pre-named pair and go forward.

I've looked around and can't find a net2kiss.c that does Unix98.
I don't really know when and why this style of pty came into being...
and I'm wondering if there's a common way to tweak the kernel
to use the old style? Perhaps the driver is there and I just
need to create the ptys?

Suggestions and experience welcome.

VY 73 de chris K6DBG
