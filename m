From: John Ackermann N8UR <jra@febo.com>
Subject: Re: Tracking down a Linux crash (update)
Date: Fri, 18 Oct 2002 13:55:52 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <21119277.1034949352@WUSJA129861-8HP>
References: <1034962886.26779.21.camel@maze.mythral.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1034962886.26779.21.camel@maze.mythral.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ray Heasman <nurf@spamcop.net>
Cc: linux@lists.tapr.org, linux-hams@vger.kernel.org

Hi Ray --

Thanks for that tip; someone else mentioned it without providing any 
context but I just found more detail while looking at nvidea's website (I'm 
going to try using a Geforce card).

According to nvidea, kernel 2.4.19 is supposed to incorporate the fix for 
this problem.  Since that's what I'm running, I suspect that this isn't the 
cause (though my next step if I still crash with the new card will be to 
use the nopentium setting).

Thanks!

John

--On Friday, October 18, 2002 10:41 AM -0700 Ray Heasman <nurf@spamcop.net> 
wrote:

> Hi John,
>
> One more thing you should consider with an AMD CPU - make sure you have
> "mem = nopentium" appended to your kernel boot line. This is usually set
> in your lilo.conf using the "append" keyword.
>
> This resolves (mostly) some nasty conflicts you can get between AMD
> cache memory and AGP memory. This stopped my AMD system from randomly
> freezing. Since then, the only reboots I have had have been to upgrade
> kernels.
>
> Oh, and the Mozilla-Flash freeze only freezes Mozilla, not your whole
> system.
>
> Cheers,
> Ray
> ZR6RAY
>
>
>
>
>
>



----
John Ackermann    N8UR         jra@febo.com     http://www.febo.com
President, TAPR                n8ur@tapr.org    http://www.tapr.org

