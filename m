From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: sound card modem on a laptop?
Date: Sun, 18 Jan 2004 18:02:03 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040118180203.A211@jeroen.pe1rxq.ampr.org>
References: <20040117124207.3584bc09.washer@trlp.com> <1074441674.1290.22.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1074441674.1290.22.camel@oh2bns.ampr.org>; from oh2bns@sral.fi on Sun, Jan 18, 2004 at 17:01:15 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tomi Manninen <oh2bns@sral.fi>
Cc: James Washer <washer@trlp.com>, linux-hams@vger.kernel.org

On 2004.01.18 17:01:15 +0100 Tomi Manninen wrote:
> On Sat, 2004-01-17 at 22:42, James Washer wrote:
> 
> > I'm just about to begin playing with AX.25/Linux.. I'd like to get a 
> > soundcard modem running on a laptop (IBM Thinkpad), for packet and APRS
> use. 
> > 
> > I'm fairly knowledgable with linux, but not with soundcards and AX.25..
> > 
> > Is anyone else doing this successfully?
> > 
> > Should I start with a 2.6 kernel, or is that too bleeding edge for now?
> 
> A comment about 2.6 kernels. Even though I haven't had a chance to try
> it myself yet (lazy me), I have been told that the MKISS driver in the
> 2.6 kernel doesn't compile.
> 
> The kernel mode soundmodem has been removed in 2.6 so you have
> to use the user mode soundmodem [1], and it's better anyway. However, 
> the user mode soundmodem needs the MKISS driver to talk to the kernel.
> So if the driver really does not compile, you can't use 2.6...

I have made some patches a while ago to fix the scc and mkiss driver in
2.6.0 and 2.6.1. They haven't made it in mainline though.
In 2.6.1 you get another warning about mkiss using cli() I have made a
patch to remove it but have yet to test it.

Jeroen

