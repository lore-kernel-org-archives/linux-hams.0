From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: Netrom Changes in G8PZT's Xrouter Software.
Date: Thu, 29 Aug 2002 13:14:28 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0208291306580.29121-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.33.0208282345050.25137-100000@gb7lgs.ampr.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0208282345050.25137-100000@gb7lgs.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stewart Wilkinson <g0lgs@gb7lgs.co.uk>
Cc: linux-hams@vger.kernel.org

On Thu, 29 Aug 2002, Stewart Wilkinson wrote:

> Having spoken to Paula (G8PZT) tonight, she informs me that the next
> release of her Xrouter (V1.77) which is due out in a few days, implements
> addtional NETROM FrameType (0x07) which for Xrouter is effectively a
> NETROM <DM> frame. (As I understand it, this gets over a few problems with
> NETROM not noticing a distant router has rebooted and so can't handle
> traffic on L3/L4 sessions that were open before the reboot, much more
> quickly that simply waiting for the L4 Retry setting to be exceeded).

I tried something similar in the Linux NET/ROM stack some time ago 
re-using the CONNACK/CHOKE flag combination. However I got reports that 
sending these frames killed some version of BPQ. Clearly a bug in BPQ but 
I decided it's better to disable it in Linux anyway.

Could you ask Paula to send me details about the new extension. It should 
be easy to make Linux do the right thing with it. And while she is at it, 
it would be nice to see descriptions to the other extensions she has 
implemented.

> As a possible workaround for the 2.4.17 Kernel, I have modified the
> nr_rx_frame function in af_netrom.c by replacing the lines:

Why not copy the fix from 2.4.18/19? Or why not copy the whole NET/ROM
stack from 2.4.18/19? Even better, why not upgrade to 2.4.19? :)

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

