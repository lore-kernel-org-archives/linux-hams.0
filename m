From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: PTT with soundmodem
Date: Mon, 2 Feb 2004 09:09:20 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040201220920.GA18771@cloud.net.au>
References: <20040201215530.GA572@strauss.udel.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040201215530.GA572@strauss.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

On Sun, Feb 01, 2004 at 04:55:30PM -0500, Mike Markowski wrote:
> I'm thiiis close to having my packet set up working in kernel 2.4.24
> (currently unpatched).  I'm using the user space soundmodem to create
> interface ax0 -- so I assume I don't need to do a kissattach.  When I
> use soundmodemconfig to test the setup, I can successfully use the
> PTT gui button to get my rig to transmit (and also have no problem
> with PTT when using Tomi's great gMFSK!).  However, while i can
> receive APRS packets while running xastir, when it tries to transmit,
> soundmodem complains after the xastir info:
> 
>    Tx: fm AB3AP-0 to APX121-0 via RELAY-0,WIDE-0 UI^ pid=F0
>    =/:B7_;?z&y ab3ap@arrl.net, Avondale PA (XASTIR-Linux)
>  
>    sm[15891]: ioctl: SNDCTL_DSP_SYNC: Device or resource busy (16)
> 
> I see the LED on my PTT interface briefly light, but not long
> enough to activate the rig itself before the error above is
> printed.

Do you have any other programs at all accessing the sound card? Things
like the sound server for KDE or GNOME?

Is AX.25 working properly in 2.4.24? I was under the impression that it
was never reliable in 2.4, and fixes are going straight to 2.6. I'm
still running 2.2 on my packet machine.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
