From: Steven Whitehouse <steve@gw.chygwyn.com>
Subject: Re: Demise of AX.25 raw sockets
Date: Mon, 7 Jul 2003 08:45:38 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200307070745.IAA12406@gw.chygwyn.com>
References: <1057514493.1272.55.camel@oh2bns.ampr.org>
Reply-To: Steve Whitehouse <Steve@ChyGwyn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1057514493.1272.55.camel@oh2bns.ampr.org> from "Tomi Manninen" at Jul 06, 2003 09:01:33 PM
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tomi Manninen <oh2bns@sral.fi>
Cc: linux-hams@vger.kernel.org

Hi,

> 
> On Sun, 2003-07-06 at 18:05, Steven Whitehouse wrote:
> 
> >  - No application that I've seen actually uses them (of course someone on
> >    this list might prove me wrong on this point!)
> 
> About three years ago I rewrote netromd to use a PF_AX25, SOCK_RAW,
> NETROM_PID socket for receiving NODES broadcasts. The main reason
> for the rewrite was to support digipeated broadcasts. Raw socket was
> an easy way of getting the digi path.
> 
> Unfortunately at that time something was broken in the kernel
> (ax25_getname IIRC) so it only worked with a patched kernel.
> Also there wasn't much interest in it so it was all forgotten.
> 
> I don't know of any other programs using raw AX.25 sockets.
>
Ok. Thats not too much of a problem it seems but another use has now also
been posted on the list so I'll investigate that too.
 
> >  - They are broken and haven't worked for some time and I've not seen any
> >    bug reports posted recently (again leading me to think nothing uses them).
> 
> How exactly is it broken?
>
If you look at the packet delivery code and ignore the fact that the
locking is broken for the moment then it looks rather odd since it does:

 1. Search for first socket which is of type raw and has a matching
    address. If found then do:
 2. Deliver to all raw sockets which come after the first one and have
    enough buffer space left (i.e. there is no match on the address) and
    also match on the protocol field.

So whether or not you see a packet not destined for the address you are
listening for depends on the "random" position of your socket in the AX.25
sockets list. Also note that the socket found in step 1 might not actually
get the packet sent to it in the case that it matches on address but not
on protocol although it will still trigger step 2. Confused? I hoped that
if applications existed (which it appears they do) it might clarify whats
supposed to happen :-)
 
> >  - The PF_PACKET family would seem to be just as good an option for
> >    application writers.
> 
> Most applications use PF_PACKET but there is the problem that it needs
> elevated privileges. Granted, using a raw socket and binding it to
> anything else than your own callsign also needs privileges so this
> may not be an issue.
> 
> Anyway using PF_PACKET for just about everything like it is currently
> is in my opinion ugly so I would prefer maintaining raw socket support
> if possible.
>
Ok. Well it looks now like there are uses for it, so I'll fix it rather
than removing it - I just didn't want to spend time on it if nobody was
using it,

Steve.

