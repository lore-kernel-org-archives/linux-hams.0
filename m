From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: sound card modem on a laptop?
Date: Sun, 18 Jan 2004 18:01:15 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1074441674.1290.22.camel@oh2bns.ampr.org>
References: <20040117124207.3584bc09.washer@trlp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040117124207.3584bc09.washer@trlp.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Washer <washer@trlp.com>
Cc: linux-hams@vger.kernel.org

On Sat, 2004-01-17 at 22:42, James Washer wrote:

> I'm just about to begin playing with AX.25/Linux.. I'd like to get a 
> soundcard modem running on a laptop (IBM Thinkpad), for packet and APRS use. 
> 
> I'm fairly knowledgable with linux, but not with soundcards and AX.25..
> 
> Is anyone else doing this successfully?
> 
> Should I start with a 2.6 kernel, or is that too bleeding edge for now?

A comment about 2.6 kernels. Even though I haven't had a chance to try
it myself yet (lazy me), I have been told that the MKISS driver in the
2.6 kernel doesn't compile.

The kernel mode soundmodem has been removed in 2.6 so you have
to use the user mode soundmodem [1], and it's better anyway. However, 
the user mode soundmodem needs the MKISS driver to talk to the kernel.
So if the driver really does not compile, you can't use 2.6...

/Tomi

[1] http://www.baycom.org/~tom/ham/soundmodem/ 

-- 
Tomi Manninen / OH2BNS / KP20ME04

