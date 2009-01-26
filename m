From: Thomas Osterried <ax25@x-berg.in-berlin.de>
Subject: Re: Problems with ax25d/axspawn on OpenSuSE 11.0 32-bit
Date: Mon, 26 Jan 2009 17:51:46 +0100
Message-ID: <20090126165146.GA9887@x-berg.in-berlin.de>
References: <alpine.LNX.1.10.0901172222000.22616@wapiti2.we7u.net> <alpine.LNX.1.10.0901231008510.23524@wapiti2.we7u.net> <alpine.LNX.1.10.0901242044100.4122@wapiti.we7u.net> <200901251433.26055.n7ipb@wetnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200901251433.26055.n7ipb@wetnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ken Koster <n7ipb@wetnet.net>
Cc: linux-hams@vger.kernel.org

On 2009-01-25 14:33:24 -0800, Ken Koster <n7ipb@wetnet.net>
wrote in <200901251433.26055.n7ipb@wetnet.net>:
> > > *) Connected mode using axspawn loses LOTS of data.  It might be
> > >   useful to test another connected-mode AX.25 app to see where the
> > >   problem lies, in the AX.25 modules or in axspawn.
> 
> To follow up on Curt's comment,  it's probably not really axspawn or ax25d
> since ultimately they just use execve to execute 'login'.   

the old axspawn had the issue that write()'s return value was not used
correctly.

The new axspawn is even compatible with the #BIN# protocol.

I have written the tools bput and bget, which enables you to up/download
any file with your favourite packet program to the shell session at the
remote site.


An issue concerning the kernel-ax25 we found a few days past:

we observed, that it could happen that the rf transmission did not has
incremented the session number of the I-frame. This means, that there
may be two or more different data-packets with the same sequence number -
with the result that the receiving site misses that data.

We think it's a smp-problem: non-smp kernels did not show this behaviour
(or at least it is rare that we still have not seen it when testing).

We testet this least with kernel 2.6.24 to 2.6.28.1, but also heard that
the problem was seen many years past with kernel 2.4.x.

73,
	- Thomas  dl9sau

