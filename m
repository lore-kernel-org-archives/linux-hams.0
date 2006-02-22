From: Bill Vodall <wa7nwp@jnos.org>
Subject: Re: Net2kiss - multiple ports
Date: Wed, 22 Feb 2006 10:11:30 -0600 (CST)
Message-ID: <Pine.LNX.4.44.0602221009310.13424-100000@srv01.compumont.com>
References: <200602220832.25816.pa3gcu@zeelandnet.nl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200602220832.25816.pa3gcu@zeelandnet.nl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


> > Has anybody looked at tweaking net2kiss to handle multiple net streams?
> >   This would be the reverse of mkiss...   I have two ax25 ports.  APRS
> > and EOC.  It would be neat to be able able to merge them on to a single
> > KISS stream with different KISS channel id's -- like the KISS output of
> > a dual port TNC such as a KAM or 9612.
> >
> 
> Its been a long tine since i used ax25 but would kissnetd not help you 
> here.???


It looks like that's close.  I'm guessing it would be an every packet
to every interface setup.  If kissnetd was used on two or more AXn ports,
wouldn't everything heard on one be sent out the others?   Also it
doesn't appear to deal with the KISS stream numbers (0..7)

Thanks,
Bill - WA7NWP


