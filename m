From: N1UAN Bob <bobbru@chartertn.net>
Subject: Re: ax25ipd
Date: Sun, 25 Aug 2002 23:13:01 -0400 (EDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0208252310120.1012-100000@n1uan.ampr.org>
References: <005c01c24cb9$24673700$04590cca@apana.org.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <005c01c24cb9$24673700$04590cca@apana.org.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Fraser <sfraser@sierra.apana.org.au>
Cc: linux-hams@vger.kernel.org

Hi Steve
thanks and that does work
but now it see that i can get it to connect anywhere
i do have the kissattach up etc
funny i only can get the kissattach to work with cetrian tty or pty
the only tty is S1 and the ptyb2  but i am not sure what i am suppose to
use here to get this to work and  it saids one end of the pipe where is
the other end what place
maye you can give me some ideas in that area!
thanks
Bob


On Mon, 26 Aug 2002, Steve Fraser wrote:

> Bob wrote,
>
> > I am trying to run the  ax25ipd and each time i do i get
> > config not found or could not be open the config file is in
> > /etc/ax25 dir  so wonder why it wont load any ideas!
>
> This was an area that changed somewhere in ax25ipd. I'm not sure which
> versions, but at least one version DOESN'T default the config file
> location/name. Try using the command option (-c I think) to tell it where
> the config file is.
>
> e.g.
>
> ax25ipd -c /etc/ax25/ax25ipd.conf
>
> cheers
> Steve
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

