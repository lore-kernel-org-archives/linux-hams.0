From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: routing
Date: Sun, 7 Sep 2003 16:03:48 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030907160348.A1291@jeroen.pe1rxq.ampr.org>
References: <20030906224756.74436.qmail@web11002.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030906224756.74436.qmail@web11002.mail.yahoo.com>; from andrewjj20@yahoo.com on Sun, Sep 07, 2003 at 00:47:56 +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: andrewjj20@yahoo.com
Cc: linux-hams@vger.kernel.org

On 2003.09.07 00:47:56 +0200 Joshua wrote:
> could somebody recommend a routing protocol for the
> folowing network design.
> 
> ++++++++++++++++
> +              +
> o----o----o----o
> |    |    |    |
> s    s    s    s
> 
>  the s's are subnets that are connected to each other
> through a router o. the o's are routers that have to
> ax.25 ports one on one frequency for the subnet it is
> connected to, and one connecting it to surrounding
> routers; the two on the ends have a third port to each
> other via an hf-link, and the other links are vfh.
> assume that each router can only communicate with it's
> direct neighbors, except the end routers wich can
> communicate through a different link

It depends what you want... just ax25 connections? tcp/ip?
If it just an amateur radio network look at netrom, if you want ip look at
something like rip.

Jeroen

