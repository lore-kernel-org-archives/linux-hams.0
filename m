From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: AX25/NETROM
Date: Tue, 13 May 2003 14:36:10 +0300 (EETDST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10305131431470.26336-100000@saturn.trs.ntc.nokia.com>
References: <S262447AbTELTDp/20030512190345Z+8235@vger.kernel.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <S262447AbTELTDp/20030512190345Z+8235@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ron <ke7rt@clearwater.net>
Cc: Linux-Hams@vger.kernel.org

On Mon, 12 May 2003, Ron wrote:

> kissattach /dev/ttyS0 spider 192.168.0.0
> kissattach /dev/ttyS1 spideruse 192.168.0.0
> kissparms -p spider -t 150 -l 150 -s 50 -r 50
> kissparms -p spideruse -t 150 -l 150 -s 50 -r 50
> nrattach netrom
> nrattach netrom2

> LINUX --->nrconfig:port netrom not active
> LINUX --->nrconfig:port netrom2 not active
> LINUX --->rsconfig: port  rose not active

I think you need to give the netrom interfaces an IP number too. Try the
"-i" option to nrattach. And by the way it might be better to not use
192.168.0.0 as the IP number as it's a network address. Use .1 instead.

The ROSE warning you can probably ignore or better, edit "rsports" and
comment the default config out.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

