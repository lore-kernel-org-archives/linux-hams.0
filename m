From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: Problems with UI frame reception
Date: Tue, 23 Jul 2002 15:26:30 +0300 (EETDST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10207231500020.27870-100000@saturn.trs.ntc.nokia.com>
References: <Pine.GSO.4.44.0207222123320.13893-100000@rescomp.Stanford.EDU>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.GSO.4.44.0207222123320.13893-100000@rescomp.Stanford.EDU>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Cutler <jwc@stanford.edu>
Cc: linux-hams@vger.kernel.org

On Mon, 22 Jul 2002, James Cutler wrote:

I'll start from the end...

> PS...I've hacked up "listen.c" code to do this but that uses SOCK_PACKET.
> It would be much cleaner to us DGRAMs but I'm having this reception
> issues.

Yes, it would be but it seems that this part of the Linux AX.25 stack
isn't quite "ready". The way it works is a bit vague and maybe even buggy.
So everyone uses SOCK_PACKET...

A few years ago I rewrote netromd to do the route broadcast listening with
SOCK_RAW sockets but I couldn't release it as it would have required a
kernel patch as well (there was a bug in the received address handling)...

> First, I have to call "connect" (in addition to creating and binding the
> socket) on the receive socket for anything to be received.  And then it
> only receives packets from the socket I "connected" to.  Which makes sense
> but I'm confused why I need to "connect" a receive socket?

Hmm. This seems odd. My memory is a bit vague but looking at my code I
have done:

  s = socket(PF_AX25, SOCK_RAW, NETROM_PID);
  sprintf(buf, "NODES via %s", ax25_config_get_addr(portname));
  alen = ax25_aton(buf, &sa);
  bind(s, (struct sockaddr *)&sa, alen);

Then I sit on select() and finally:

  size = recvfrom(s, buf, sizeof(buf), 0, (struct sockaddr *)&sa, &alen);

This way all heard UI frames that have the destination address NODES
and PID=NETROM should be received (and I get the sender address plus the
used digipeater path in `sa').

> Second, the packets I do receive are missing the first byte.  The first
> byte is cut off.

Yes, this seems to be the difference between SOCK_RAW and SOCK_DGRAM. The
latter chops off the PID byte at the start.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

