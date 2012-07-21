From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: ax.25 localhost?
Date: Sun, 22 Jul 2012 00:12:50 +0300
Message-ID: <500B1B52.8050705@sral.fi>
References: <20120721160848.GX17345@belle.intranet.vanheusden.com> <500ADCF8.5050505@boling.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <500ADCF8.5050505@boling.us>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

Hi,

>> is it not possible to an 'axcall' to a call on the local system?
>
> What kind of AX.25 device are you having axcall use?  My experience is
> that BPQ Ethernet won't do anything unless it actually hits an Ethernet
> device, so I usually use a virtual machine for testing that way.  You
> could probably set up an AXIP/AXUDP tunnel, but I've never tried it.
>
> Hopefully someone else has better ideas than I do, because it *would* be
> handy to have an easy way to connect on a virtual loopback device.

I don't think kernel supports looping back on AX.25 level. You can do
something similar with pseudo tty's but it's not quite the same.

But I know that NET/ROM in Linux does support loopback. You can connect
to any NET/ROM service on your system from your system.

/Tomi

