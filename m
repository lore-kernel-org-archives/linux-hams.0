From: "Charles Boling (AD7UF)" <junk07+ham@boling.us>
Subject: Re: ax.25 localhost?
Date: Sat, 21 Jul 2012 09:46:48 -0700
Message-ID: <500ADCF8.5050505@boling.us>
References: <20120721160848.GX17345@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20120721160848.GX17345@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> is it not possible to an 'axcall' to a call on the local system?

What kind of AX.25 device are you having axcall use?  My experience is
that BPQ Ethernet won't do anything unless it actually hits an Ethernet
device, so I usually use a virtual machine for testing that way.  You
could probably set up an AXIP/AXUDP tunnel, but I've never tried it.

Hopefully someone else has better ideas than I do, because it *would* be
handy to have an easy way to connect on a virtual loopback device.














