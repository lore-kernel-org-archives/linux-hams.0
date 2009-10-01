From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: mkiss kernel driver problems
Date: Thu, 1 Oct 2009 17:33:17 +0300
Message-ID: <20091001143317.GD22922@mea-ext.zmailer.org>
References: <20091001115809.GC22922@mea-ext.zmailer.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091001115809.GC22922@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, Oct 01, 2009 at 02:58:09PM +0300, Matti Aarnio wrote:
> Mostly the mkiss line discipline module seems to work, but..
> 
>   mkiss: ax0: crc mode is auto.
>   mkiss: ax0: Switchting to crc-smack
> 
> that typo (extra 't') is obvious, but I am wondering,
> why it has growing error counter:

Aargh..  error rate is near 4/256 - meaning I forgot to KISS encode
the SMACK CRC bytes...  

But this Brown Paper Bag  type "user error" is no excuse for
that kernel typo.


Why do I need to feed AX.25 frames from user program to kernel
with SMACK code variant?  My  aprx  software reads async serial
ports itself, and does all manner of port re-init in case of
for example an USB serial dongle needing it.

To live with kernel AX.25 network, serial ports that are not
attached to kernel with kissattach/mkiss do need to be fed
to kernel.  However the feed method may sometimes write incomplete
frame to kernel, and having 1-(2^-16) change of spotting that
is better than without SMACK -- plain KISS has 0 change of spotting
incomplete frame.

What I really would like is to use socket to feed to kernel
AX.25 packets that I got from somewhere, but somehow it does
look like it is not possible at all.  I would do AX.25 socket
creation,  bind() it with callsign I want, and then to send()
using that socket _without_ destination address having ever
been defined.  But I do not think that is really possible, all
sockets are "application" side, never "network devices".
Or can somebody come up with a fancy way to use for example
the raw socket for this ?

That is, a socket which says "I am device N0NNN-5", and sends
raw AX.25 frame to kernel AX.25 "network."

Heck..  I would like to bridge AX.25 network using SCTP's
reliable datagram protocol (or IP/UDP).  The Bridge software
would reside in userspace, but how could I pass a packet
most easily to kernel without going via pty+kiss mess ?


> ax0       Link encap:AMPR AX.25  HWaddr OH2MQK-1
>           UP BROADCAST RUNNING NOARP  MTU:512  Metric:1
>           RX packets:9325 errors:152 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:10
>           RX bytes:622232 (607.6 KiB)  TX bytes:0 (0.0 b)
> 
> I am feeding this interface from my own software via pty interface,
> where the client side is turned on to KISS line discipline.
> 
> My own software is not complaining about incomplete writes,
> thus I wonder what the kernel is doing ?  Also my software
> is sending on only AX.25 frames that it considers to be valid.
> 
> Does anybody remember how the  mkiss.c  is supposed to work?

  73 de Matti, OH2MQK
