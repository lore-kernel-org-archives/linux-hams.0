From: Scott Ehrlich <scott@ehrlichtronics.com>
Subject: Re: [HELP] Sound card as TNC, Kernel 2.4.22, Intel board
Date: Thu, 30 Oct 2003 05:58:14 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0310300558060.9042@debian.ehrlichtronics.com>
References: <Pine.LNX.4.44.0310301707300.23550-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0310301707300.23550-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Cc: linux-hams@vger.kernel.org

It actually does not exist:

sudo /sbin/ifconfig ax25 up
ax25: ERROR while getting interface flags: No such device

sudo /sbin/ifconfig ax.25 up
ax.25: ERROR while getting interface flags: No such device

This is why I seek help in trying to make it appear.

Scott

On Thu, 30 Oct 2003, Wilbert Knol wrote:

>
> > > <snip> /sbin/ifconfig -a shows
> > > AX.25 ports exist.
>
> That tells you the driver is loaded, and that the network interface
> exists.
>
> Now check that the interface is 'up' with:
>
>   /sbin/ifconfig <interface_name>
>
> If not, start it with:
>
>   /sbin/ifconfig <interface_name> up
>
> Suggest you verify it works by using another application, like 'call'.
> Hope this helps.
>
>
>
> Wilbert, ZL2BSJ
>
>
>
>
