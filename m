From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: sound card modem on a laptop?
Date: Mon, 19 Jan 2004 01:14:00 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040119011400.A7032@jeroen.pe1rxq.ampr.org>
References: <20040117124207.3584bc09.washer@trlp.com> <1074441674.1290.22.camel@oh2bns.ampr.org> <400B2A0E.8030208@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <400B2A0E.8030208@ccr.jussieu.fr>; from pidoux@ccr.jussieu.fr on Mon, Jan 19, 2004 at 01:51:26 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: Tomi Manninen <oh2bns@sral.fi>, James Washer <washer@trlp.com>, linux-hams@vger.kernel.org

On 2004.01.19 01:51:26 +0100 Bernard Pidoux wrote:
> Tomi Manninen wrote:
> > 
> > A comment about 2.6 kernels. Even though I haven't had a chance to try
> > it myself yet (lazy me), I have been told that the MKISS driver in the
> > 2.6 kernel doesn't compile.
> > 
> > The kernel mode soundmodem has been removed in 2.6 so you have
> > to use the user mode soundmodem [1], and it's better anyway. However, 
> > the user mode soundmodem needs the MKISS driver to talk to the kernel.
> > So if the driver really does not compile, you can't use 2.6...
> > 
> > /Tomi
> 
> I have been experimenting Mandrake Linux 10.0 rc with kernel 2.6.0 and 
> the last AX25 patches
> included into 2.6.1 kernel.
> 
> Mkiss driver is running well and there was no compilation problem here.

It depends on how many warnings and debugging you have turned on, although
it compiles fine there is a warning about cli() being used. It is buggy
with that respect although very hard to trigger in normal use.
What can be triggered easily is another bug in the reuse of the netdevice
structure that happens when kissattach is killed and a new kissattach
process is started...
I have fixes for both that are now being tested and it looks good sofar.

Jeroen

