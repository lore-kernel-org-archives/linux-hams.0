From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: libax25 axio_flush bug hangs node and fix
Date: Thu, 17 Oct 2002 21:17:21 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021017211721.A254@jeroen.pe1rxq.ampr.org>
References: <Pine.LNX.4.44.0210171640370.17440-100000@oh2bns.ampr.org> <3DAF0472.DA0D4FF2@algonet.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3DAF0472.DA0D4FF2@algonet.se>; from K-Jarl@algonet.se on Thu, Oct 17, 2002 at 20:41:54 +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kjell Jarl <K-Jarl@algonet.se>, linux-hams <linux-hams@vger.kernel.org>

On 2002.10.17 20:41:54 +0200 Kjell Jarl wrote:
> > No it isn't. This bug is only in 0.0.10. What exactly freezes?
> 
> I get a kernel panic. Similar to
> 
> > <0> Kernel panic: Aiee, killing interrupt handler!
> > In interrupt handler - not syncing
> 
> I do not have a recent write down.
> 
> I am using a USCC card, which I have been suspecting before. But it
> seems to be related to either netrom/node disconnects possibly with
> outstanding frames or tcp/ip started from node, or an DISC/UA at the
> ax.25 link layer.
> 
> I have seen the DISC/UA in listen on a frozen vnc screen before (vnc)
> tcp retried out and the screen wanished.

I have a been chasing a bug that seems similar lately....
It looks like something goes wrong in sock_def_write_space(). It is called
as a result of kfree_skb().
I have been trying to find the cause of it but have been unsuccessfull
sofar.
The problem I have is that it only occurs about once a week, so any fix I
think I make takes at least a week to test :( unless I find a way to
trigger it faster.

Jeroen


