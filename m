From: Alex V Flinsch <avflinsch@att.net>
Subject: Re: gMFSK/hamlib/parport
Date: Wed, 18 Feb 2004 18:32:15 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1077147135.6923.8.camel@homer.linux1.lan>
References: <20040218152745.GD16991@strauss.udel.edu>
Reply-To: avflinsch@att.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040218152745.GD16991@strauss.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

On Wed, 2004-02-18 at 10:27, Mike Markowski wrote:
> Hi all,
> 
> A couple questions about the excellent gMFSK 0.6beta2:
> 

Execllent? I consider it to be a step above excellent!

> 
>       Bug report (but maybe in hamlib):
>       - I'm using an ICOM 706 MkIIg with hamlib on ttyS0 and
>         PTT to "none" in gMFSK just for the sake of seeing how
>         gMFSK uses hamlib.  When I rotate the rig's tuning knob,
>         gMFSK works for a bit nicely updating the spectrum freqs,
>         but then I get a "Protocol error" and hamlib is disabled.
>         I assume the data out of the rig is changing too rapidly
>         for hamlib to capture it?  Or maybe gMFSK is trying to
>         reread the data too frequently?
> 

I just tried this on my system (Yaesu FT100,gMFSK-0.6beta2,
hamlib-1.2.0) and this does not occur, if there is a problem, it might
be in the IC-706 implementation in hamlib, what version of hamlib are
you using? 


BTW I have only had one problem with gMFSK, and that has been happening
for quite sometime (I think it started around version 0.5). Sometimes
(that's the killer) the program will lock up when switching modes. Has
anyone else had that problem?




-- 
Alex / AB2RC 
Yaesu FT100 software for Linux http://www.qsl.net/kc2ivl
Why do they call Radio "Wireless", between my shack and antennas
I must have over 1500 feet of wire!

