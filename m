From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: [HELP] Sound card as TNC, Kernel 2.4.22, Intel board
Date: Thu, 30 Oct 2003 17:16:10 +1200 (GMT-12)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0310301707300.23550-100000@zl2bsj.ampr.org>
References: <Pine.LNX.4.33.0310290948530.12192-100000@wapiti.tc.fluke.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0310290948530.12192-100000@wapiti.tc.fluke.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Scott Ehrlich <scott@ehrlichtronics.com>


> > <snip> /sbin/ifconfig -a shows
> > AX.25 ports exist.

That tells you the driver is loaded, and that the network interface
exists.

Now check that the interface is 'up' with:

  /sbin/ifconfig <interface_name>

If not, start it with:

  /sbin/ifconfig <interface_name> up

Suggest you verify it works by using another application, like 'call'.
Hope this helps.



Wilbert, ZL2BSJ



