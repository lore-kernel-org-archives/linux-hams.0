From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: ax25ipd
Date: Mon, 26 Aug 2002 06:17:12 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <02082606171202.02211@unix.pa3gcu>
References: <Pine.LNX.4.33.0208252310120.1012-100000@n1uan.ampr.org>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0208252310120.1012-100000@n1uan.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: N1UAN Bob <bobbru@chartertn.net>
Cc: linux-hams@vger.kernel.org

On Monday 26 August 2002 03:13, N1UAN Bob wrote:
> >
> > > I am trying to run the  ax25ipd and each time i do i get
> > > config not found or could not be open the config file is in
> > > /etc/ax25 dir  so wonder why it wont load any ideas!
> >
> > This was an area that changed somewhere in ax25ipd. I'm not sure which
> > versions, but at least one version DOESN'T default the config file
> > location/name. Try using the command option (-c I think) to tell it where
> > the config file is.
> >
> > e.g.
> >
> > ax25ipd -c /etc/ax25/ax25ipd.conf
> >
> > cheers
> > Steve

Use the otherside of the tty/pty pair is what is meant, the opening side is 
defined in ax25ipd.conf an example would be;


device /dev/ttyqa

You then use kissattach to attach the other side as;
kissattach -l  /dev/ptyqa axip 44.56.26.4

Take a look at my home page it has examples..

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

