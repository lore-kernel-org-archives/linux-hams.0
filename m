From: Roger Harris <roger@g3zfr.freeserve.co.uk>
Subject: Re: RedHat 7.3 and AX25
Date: Sat, 07 Sep 2002 07:35:53 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <5.1.0.14.0.20020907072816.00aaaec0@pop.freeserve.net>
References: <Pine.LNX.4.33.0209070059470.137-100000@gb7lgs.ampr.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0209070059470.137-100000@gb7lgs.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Stewart Wilkinson <g0lgs@gb7lgs.co.uk>

Hi Stewart

I had exactly the same problem. It seemed to ignore the request to compile MKISS into the kernel.

When I made it a module and loaded it manually, this solved the problem. 

Perhaps someone knows a bit more and can say whether this is a known bug, whether there is a fix, or whether we are both doing something wrong.

Thanks

Roger

At 02:03 07/09/02, you wrote:
>Hi,
>
>I seem to have a problem using kissattach with the 2.4.18-3 kernel. I have
>rebuilt a kernel with MKISS support on (ie: CONFIG_MKISS=y in .config),
>yet when I try to run kissattach I get:
>
>kissattach: Error setting line discipline: TIOCSETD: Invalid argument
>Are you sure you have enabled MKISS support in the kernel
>or, if you made it a module, that the module is loaded?
>
>Any Idea's ??
>
>-- 
>Stewart (G0LGS)
>g0lgs@gb7lgs.co.uk

