From: echicken <echicken@bbs.electronicchicken.com>
Subject: Re: SPAM: Re: SPAM: Re: axports & ax25d.conf
Date: Sun, 13 Mar 2011 12:34:33 -0400
Message-ID: <AANLkTi=TvfvD1k_pe4TggeyO9Hcr2kYjtQnd9+BGM__v@mail.gmail.com>
References: <AANLkTi=VNvvAe4FZmfeWRKTg3_rUcSMjycy+BLO118UN@mail.gmail.com>
	<201103131428.51446.christoph.rueckert@arcor.de>
	<AANLkTin_1fcctC7OKy3WCdZBx+JOyf+nAajjwHX-vNPK@mail.gmail.com>
	<201103131512.36492.christoph.rueckert@arcor.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=vJjMWB5WbOs/kB2XxV9iS2Xhg1BIUVeGvL5LscvnDp0=;
        b=TUtF3Ny9vnAsCvPo3k4pasOdraEIpkJvLpxRrjqiLsACmDlvDGOWOmMcnttZpZpZ44
         PyURMUKM8jEJZaZY7wFRJ31wV8kqAwDM0NsyuqhAYOEMkArqWDBGqYbyrQGGwe4leWrn
         p2N291aybLCNLdgRTShcnU+T/RY57gCpxMPJM=
In-Reply-To: <201103131512.36492.christoph.rueckert@arcor.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

> which type of packet BBS be used?

It's Synchronet BBS, which is not a packet BBS at all.  It's more like
a dial-up BBS, but designed to be accessed over the internet via a
suite of Telnet, SSH, HTTP, NNTP, FTP, and various other services.

Synchronet is not packet or AX.25 aware at all and is entirely geared
toward IP.  So I'm working on allowing AX.25 clients to connect to it.

There are other approaches that I could take - I've used JNOS as a
telnet gateway, with some success, but I'm looking for a cleaner and
more automated way of doing it.

> Please test the axconv-program in a command terminal:
>
> sudo axconv 192.168.1.75 2000
>
> The program axconv displays the std-output of your program just in one line.
> When the output is ok, try following:

Yes, as I said in my original post, I can do that and the output is
what I'm expecting to see.

> Define a IP-address for your ax0 device, e.g.:
> /usr/local/sbin/kissattach /dev/ttyUSB0 ax0 192.168.2.74

I'll give this a shot and let you know if it makes any difference.

Thanks,

Derek
