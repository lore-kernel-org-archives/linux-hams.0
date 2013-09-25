From: marius@yo2loj.ro
Subject: Re: RaspberryPI and soundmodem PTT
Date: Wed, 25 Sep 2013 10:27:54 +0300
Message-ID: <304c7be18259b790925fe766adf1b718.squirrel@mail.quailcro.com>
References: <52428f657519e5.11288990@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <52428f657519e5.11288990@wp.pl>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>


Hi Waldek,

>
> MyCall         SP2ONG-11  # SP2ONG-2 is may call for NodeID
> PollInterval        300
> # sr1dsz my XNet flex neighbor sr1dsz don't use SSID
> FlexGate        sr1dsz
> MyGate sr1dsz
> MyRange         0-0
>
> and add in uronode.routes
>
> route sr1bsz polnet axudp d 'XNet Flexnet node'
>

You mean
route sr1dsz polnet axudp d 'XNet Flexnet node'
(dsz instead of bsz...)


> When I have start flexd I have see in mointor
> ...

It seems that your system is not able to set up a link with SR1DSZ.
Check first in your node, without starting flexd that the partner is
accessible via ax.25 (also delete the files in /var/ax25/flexd):

C axudp sr1dsz

If it works, check if it provides flexnet routes using the 'D' command

This is how your flexd works, so any failure gere will lead to flexd not
working.

Activate flend afterwards.

73s de Marius, YO2LOJ



