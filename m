From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: remote TNC
Date: Wed, 25 Dec 2002 23:53:30 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212252335330.4691-100000@oh2bns.ampr.org>
References: <20021225133458.GA28240@silly.cloud.net.au>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021225133458.GA28240@silly.cloud.net.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hamish Moffatt <hamish@cloud.net.au>
Cc: linux-hams@vger.kernel.org

On Thu, 26 Dec 2002, Hamish Moffatt wrote:

> 1. Computer A wants to transmit/receive on RF; RF port is attached to
>    computer B; computers are on a local Ethernet together.
> 
>    +------------+          +------------+
>    | Computer A |----------| Computer B +-- RF port (TNC etc)
>    +------------+ Ethernet +------------+
>      Runs application        Has RF port
>      eg XASTIR
> 
>    Computer A wants to work through B transparently;
>    it wouldn't have to specifically mention B in its AX.25 packet path,
>    nor would frames received back by B.

This would be a case for BPQ ether and rxecho I think. You can make it 
so that A has a TNC directly connected to it.

> 2. Same but computers are connected only via IP, not necessarily on
>    the same Ethernet:
> 
>    +------------+          +--------+           +------------+
>    | Computer A |----------+ Router +-----------| Computer B +-- RF port
>    +------------+ Ethernet,+--------+ Ethernet, +------------+
>                   PPP etc.            PPP etc.
>      Runs application
>      eg XASTIR
> 
>    Again the application on A would like to see a standard Linux
>    networking interface and think it's connected directly to RF.

Here you will have to use AXIP but I think you can still get the same as 
in hte above with rxecho.

> On a related note, can somebody give me a good description (either here
> or a URL for) for BPQ over Ethernet? Is that part of the answer to #1?
> I think AX/IP (RFC 1226) is the protocol behind #2, but does linux (ie
> ax25ipd) do this already?

Ax25ipd does RFC 1226, yes. For bpq ether I don't know about a good 
description. But it is simply AX25 over raw ethernet, so there is not much 
to it. The bpqparms(8) man page tells you pretty much everything needed to 
configure it.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

