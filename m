From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Ethereal ax25 monitoring
Date: Sat, 13 Aug 2005 22:56:46 +0100
Message-ID: <42FE6C9E.2060808@rns-stearn.demon.co.uk>
References: <620c90570508131043a53b9db@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570508131043a53b9db@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Chuck Hast wrote:
> Is there any ability to use ethereal to monitor ax25 packets, I have poked
> around and find nothing to the effect. I see that Ethereal states that it does
> monitor 706 protocols but appears that ax25 is not one of them. 
> 
> Anyone have any ideas on this?

Chuck

As of version 0.10.12 (current version) there does not appear to be a
dissector for ax.25 in the source code.

A quick rummage through the mail-list archive did return any items
indicating ax.25 as being currently known about.

There appears to be a reasonably conprehensive guide to how a new
dissector is created and connected in. I am am attempting to compile
0.10.12 to see how easily I could import an ax.25 module from a
protocol analyser I wrote some years ago.

-- 
Regards
	Richard
