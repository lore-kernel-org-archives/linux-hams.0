From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: 6pack problem
Date: Mon, 24 Mar 2003 07:21:51 +1200 (NZST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0303240716290.1056-100000@zl2bsj.ampr.org>
References: <1048413846.30392.25.camel@atlantic>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1048413846.30392.25.camel@atlantic>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "B. Stienstra" <b.stienstra@xs4all.nl>
Cc: linux-hams@vger.kernel.org


Hi Ben,

> option. The problem is that the tnc stops running after a long while,

<snip>

> After i disconnect the 12volt from the tnc and then reconnect it with
> 12v the /var/log/messages says:
> Mar 23 10:06:18 atlantic kernel: 6pack: TNC found.
> 
> And the tnc is up and running. Does anyone know what the problem could

I had exactly the same problem with a TNC2 (Tiny-2). It turned out to be a
hardware problem. I ended up re-flowing every joint on the board. The
problem went away for a few months.
 
Eventually, I replaced the MAX231 RS232<>TTL converter, which cured it.


Wilbert.



