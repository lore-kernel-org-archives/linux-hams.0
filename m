From: "Steve Fraser" <sfraser@sierra.apana.org.au>
Subject: Re: ax25ipd
Date: Mon, 26 Aug 2002 13:59:17 +0930
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <005c01c24cb9$24673700$04590cca@apana.org.au>
References: <Pine.LNX.4.33.0208252223370.730-100000@n1uan.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: N1UAN Bob <bobbru@chartertn.net>, linux-hams@vger.kernel.org

Bob wrote,

> I am trying to run the  ax25ipd and each time i do i get
> config not found or could not be open the config file is in
> /etc/ax25 dir  so wonder why it wont load any ideas!

This was an area that changed somewhere in ax25ipd. I'm not sure which
versions, but at least one version DOESN'T default the config file
location/name. Try using the command option (-c I think) to tell it where
the config file is.

e.g.

ax25ipd -c /etc/ax25/ax25ipd.conf

cheers
Steve


