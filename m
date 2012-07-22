From: "Charles Boling (AD7UF)" <junk07+ham@boling.us>
Subject: Re: ax.25 localhost?
Date: Sat, 21 Jul 2012 22:20:41 -0700
Message-ID: <500B8DA9.5010803@boling.us>
References: <20120721160848.GX17345@belle.intranet.vanheusden.com> <500ADCF8.5050505@boling.us> <500B1B52.8050705@sral.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <500B1B52.8050705@sral.fi>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


> But I know that NET/ROM in Linux does support loopback. You can connect
> to any NET/ROM service on your system from your system.

How does that work?  If I try connecting to myself, I just get:
	axcall: NET/ROM callsign or alias not found

I then tried adding myself into my own node list using nrparms, but
since it wants an AX.25 device, we're back to the same problem; it calls
out on that device and doesn't find itself.

