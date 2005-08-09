From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Fwd: Baycom modem and simple text ui
Date: Tue, 9 Aug 2005 15:02:04 -0700
Message-ID: <4076450105080915022193e079@mail.gmail.com>
References: <407645010508091213efc990f@mail.gmail.com>
	 <20050809203304.4727.qmail@radagast.org>
	 <40764501050809150125614ea9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40764501050809150125614ea9@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 09/08/05, Dave Platt <dplatt@radagast.org> wrote:
> If the driver is loaded, and the AX.25 interface has been
> configured with a portname, then you'd probably want to try
> running commands such as:
>
>    beacon -s myport -d HEADSUP "Santa Claus on 14.020 QRO"
>
> or
>
>    call myport W9ZZZ
>
> or something like that.
>
> You can run "listen -a" in another window to monitor the
> packet traffic in both directions.

Well, I think that that steers me in the general direction, but that
sill doesn't really work. I wonder why there isn't a piece of software
that just pretends to be like a TNC so that I can can fit everything
neatly into one terminal window.

I've been following the AX25-HOWTO to get everything going. Here's what I did:

# setserial /dev/ttyS0 uart none
# insmod hdlcdrv
# insmod baycom mode="ser12*" iobase=0x3f8 irq=4
# sethdlc -p -i bcsh0 mode "ser12*" io 0x3f8 irq 4
#ifconfig bcsh0 hw ax25 KG6THI-2 up

Then I added this line to /etc/ax25/axports:

1       KG6THI-2        1200    255     2       (1200  bps)

Then running something like "listen -a" yields:

axconfig: port 1 not active
listen: no AX.25 port data configured

I'm not really clear on the difference between a "port" and the
"interface" bcsh0; but that is probably an 'RTFM' issue. I want to
think that somehow I need to associate the bcsh0 interface to the
ax.25 "port", "1".

Cheers,
joanthan - kg6thi
