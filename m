From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Demise of AX.25 raw sockets
Date: 06 Jul 2003 21:01:33 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1057514493.1272.55.camel@oh2bns.ampr.org>
References: <200307061505.QAA09236@gw.chygwyn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200307061505.QAA09236@gw.chygwyn.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Whitehouse <Steve@ChyGwyn.com>
Cc: linux-hams@vger.kernel.org

On Sun, 2003-07-06 at 18:05, Steven Whitehouse wrote:

>  - No application that I've seen actually uses them (of course someone on
>    this list might prove me wrong on this point!)

About three years ago I rewrote netromd to use a PF_AX25, SOCK_RAW,
NETROM_PID socket for receiving NODES broadcasts. The main reason
for the rewrite was to support digipeated broadcasts. Raw socket was
an easy way of getting the digi path.

Unfortunately at that time something was broken in the kernel
(ax25_getname IIRC) so it only worked with a patched kernel.
Also there wasn't much interest in it so it was all forgotten.

I don't know of any other programs using raw AX.25 sockets.

>  - They are broken and haven't worked for some time and I've not seen any
>    bug reports posted recently (again leading me to think nothing uses them).

How exactly is it broken?

>  - The PF_PACKET family would seem to be just as good an option for
>    application writers.

Most applications use PF_PACKET but there is the problem that it needs
elevated privileges. Granted, using a raw socket and binding it to
anything else than your own callsign also needs privileges so this
may not be an issue.

Anyway using PF_PACKET for just about everything like it is currently
is in my opinion ugly so I would prefer maintaining raw socket support
if possible.

>  - Its unclear exactly what the rules were for which packets should
>    be delivered to raw sockets.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

