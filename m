From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: Problems with net2kiss
Date: Sat, 25 Jul 2009 19:52:24 +0200
Message-ID: <20090725175224.GD16812@x-berg.in-berlin.de>
References: <8390870f0907250837j13e27ce4ga4f91609ea53cd6c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8390870f0907250837j13e27ce4ga4f91609ea53cd6c@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen - K1LNX <k1lnx@k1lnx.net>
Cc: linux-hams@vger.kernel.org

Hello,

debian has given with lenny, like other distributions earlier,
support for BSD-type PTYs.

All programs in ax25-apps and -tools now have full support of Unix98 PTYs
(this is also known as /dev/ptymx as master and /dev/pts/<n> (which were
automaticaly generated)). 
Please use the CVS head or try the current release candidates:
  http://www.linux-ax25.org/wiki/CVS

Btw, the symlink funktion you use (-s) is not compatible with Unix98 PTYs.
This is, because
- the author wrote his own openpty() funktion (instead of the glibc call)
  but he only implemented BSD-type PTYS. This code part is only in the
  "symlink" section.
- automatic symlinks to somewhere are a immanent security nightmare -
  you'll find many programs in history which have failed.
- "-s" is left for compatibility reasons. Since your new system without
  BSD-type PTYs went incompatible, it's an easy step to change your scripts
  for not depending on symlinks anymore.

73,
	- Thomas  dl9sau

On 2009-07-25 11:37:01 -0400, Stephen - K1LNX <k1lnx@k1lnx.net>
wrote in <8390870f0907250837j13e27ce4ga4f91609ea53cd6c@mail.gmail.com>:
> I am having a problem with net2kiss on a Debian 5.0 "Lenny" install. I
> installed ax25-tools from apt.
> 
> If I execute this command:
> 
> net2kiss -a -i ax0 -s /tmp/net2kisslink &
> 
> It errors out with this:
> 
> net2kiss: out of pseudoterminals
> 
> I tried increasing the number of available pty's as detailed here:
> http://www.cyberciti.biz/tips/howto-linux-increase-pty-session.html
> but it didn't help.
> 
> I was also able to duplicate this on a fresh install of Lenny on
> another machine, maybe something up with the package?
> 
> Has anyone ever seen this and how to fix it?
> 
> tnx and 73
> Stephen
> 
> -- 
> Stephen Brown - ARS K1LNX
> Johnson City, TN EM86
> http://www.k1lnx.net
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
