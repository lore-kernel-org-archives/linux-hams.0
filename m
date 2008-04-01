From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: What were the reasons of having IP address at AX.25 interfaces ?
Date: Tue, 1 Apr 2008 12:37:06 +0200
Message-ID: <20080401103705.GS13150@x-berg.in-berlin.de>
References: <S3540591AbYBCSQN/20080203181613Z+1592@mail.zmailer.org> <20080331215048.GB21500@linux-mips.org> <20080331220829.GO3700@mea-ext.zmailer.org> <20080401081726.GB4491@x-berg.in-berlin.de> <20080401094445.GR3700@mea-ext.zmailer.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080401094445.GR3700@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matti Aarnio <matti.aarnio@zmailer.org>
Cc: Ralf Baechle DL5RB <ralf@linux-mips.org>, linux-hams@vger.kernel.org

> I use only AX.25 UI traffic myself (APRS), thus those SABM problems do
> not bite me, but for rare CONS users they are troublesome things indeed..

exactly the same for me.
It was, when an OM, who was new to APRS, was connectecting my old kernel 2.4
box directly with his packet program.... oopsa ;)

But this kind of trouble could be solveable.

I really think, ax25 interfaces should not depend on an IP Address,
because there are reasons you may not need / want IP. Or IPv6. Or .. .

Without IP, you also have not nasty things (on misconfiguration)
like ARP, Samba Broadcasts, or the newest hypes: AVAHI mDNS broadcasts.

For this reason, kissattach's IP-address argument is now optional.
And: the brought up interface has not the "BROADCAST" flag set;
who needs broadcast, and likes kissattach to do the job, could use
the new "-b" option.

73,
	- Thomas  dl9sau
