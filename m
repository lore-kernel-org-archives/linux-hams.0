From: Jeremiah KD7DMP <jjgpg@cet.com>
Subject: Re: Help setting up a packet stack
Date: Tue, 30 Mar 2004 10:46:49 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0403301043420.14470@jazzy_earth_dragon.net>
References: <Pine.LNX.4.58.0403280803550.4899@jazzy_earth_dragon.net>
 <200403291626.52409.pa3gcu@zeelandnet.nl> <200403290723.03940.n7bfs@qwest.net>
 <200403292021.12850.pa3gcu@zeelandnet.nl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200403292021.12850.pa3gcu@zeelandnet.nl>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org



On Mon, 29 Mar 2004, pa3gcu wrote:

> On Monday 29 March 2004 17:23, Douglas Cole wrote:
> > On Monday 29 March 2004 06:26, pa3gcu wrote:
> > > On Sunday 28 March 2004 18:18, Jeremiah KD7DMP wrote:
> > > > My problem is that I need to get the KPC-3+ to talk to the KPC-9612 so
> > > > that the user and BBS ports can talk to the Backbone link port. I have
> > > > them set up to use the Build in K-Node setup.
> > >
> > > Would the program rxecho help here.
> > > If i understand you correctly you want traffic coming in on one port to
> > > go to another port, if so then rxecho is what you want, if i have
> > > misunderstood then please disregard.
> >
> > Thanks for replying Richard, we want to stack two tnc's together via their
> > serial ports and have them talk to each other.
> > The original manuals that came with the tnc's didn't seem to have the info
> > that the online manuals had, so downloading the online manuals helped in
> > that it describes the command "INTFACE" which one would set to "NET", and
> > this is supposed to put the tnc into "kanode" mode, so hopefully that will
> > work for us, but as yet we have not tried it, Jeremiah can let the list
> > know when he has a chance to verify this...
> >
> > Of course before doing this one needs to set some other parameters as after
> > setting the "INTFACE" to "NET"  one cannot send commands to the serial
> > port...
> >
> > just an fyi..
>
> Thanks for the courtious reply, however i must admit i did not read your mail
> peroperly as you said at the bottom of your mail, can anyone help us so we
> dont need to install a linux system to let the two tnc's talk to each other,
> or something to that effect.
>
> Sorry for the bandwidth.
>
> >
> > Douglas Cole   N7BFS
> > AMSAT#26182 , K2 # 544
> > http://www.users.qwest.net/~cdoug3
> > Registered Linux user # 188922
Hello all again.

Thanks for all the helpful ideas, I went and got the Newist KPC manual and
it dose seem to have the info I need in it, boy it would be nice if they
would have said that you could get up dates in the manual, oh well ^_^
So i will let every one know if it works or not, I have some work to do
out side befor i get to play with the TNC.

Thanks again every one
73 de
KD7DMP
Jeremiah
 >
> --
> If the Linux community is a bunch of theives because they
> try to imitate windows programs, then the Windows community
> is built on organized crime.
>
> Regards Richard
> pa3gcu@zeelandnet.nl
> http://people.zeelandnet.nl/pa3gcu/
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
