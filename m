From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: packet radio indoor
Date: Mon, 30 Dec 2002 12:30:50 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212301220060.6319-100000@zl2bsj.ampr.org>
References: <20021229193552.74273.qmail@web14407.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021229193552.74273.qmail@web14407.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vivi Kusumo <vivi_ksm@yahoo.com>
Cc: linux-hams@vger.kernel.org

On Sun, 29 Dec 2002, Vivi Kusumo wrote:

> my1com# ifconfig
> sm0  Link encap: AMPR AX.25 HWaddr MY1COM
>      inet addr: 44.128.1.5 Bcast: 44.128.1.255 Mask:
> 255.255.255.0
>      ..

Is sm0 'UP'?? (next line, please)

If not: 'ifconfig sm0 up'

Next: set up the IP routing (man route). See below.


> Next I have connected sc1 and sc2 using stereo cables
> as follow:

Good idea.
Run 'aumix' and make sure the line input and output are not muted.
Make sure the volumes are not right down...

Are the sound modems actually transmitting audio? Check with as 
pair of headphones. If you blow your brains out, then it's working :-)
Are you seeing anything on the interfaces? Try: 'listen -a -c'

> But the "ping", "ftp", "ssh" and "telnet" commands
> don't work from pc1 to pc2 and virce virca.
> [my1com]$ ping my2com
> PING my2com.ampr.org (44.128.1.8) from 44.128.1.5:
> 56(84) bytes of data
> >From my1com.ampr.org (44.128.1.5): Destination Host
> unreachable

You will have to tell your machine what port to send the frame on;

route add 44.128.1.8 sm0

You may also have to set an ARP entry (man arp)


Wilbert, ZL2BSJ



