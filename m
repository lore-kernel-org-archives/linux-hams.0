From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Simple BBS, again, sorry for asking twice.
Date: Wed, 25 Dec 2002 20:10:17 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021226041017.GC3554@n7xy.net>
References: <004601c2ac60$da69cd40$04590cca@apana.org.au> <Pine.LNX.4.44.0212261255470.5411-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0212261255470.5411-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Has there been any update since 0.4-pre2?  That came out quite a while
ago (and I guess the "pre2" implies that a 0.4 version is imminent).

Bob, N7XY

On Thu, Dec 26, 2002 at 01:31:19PM +1300, Wilbert Knol wrote:
> 
> I guess my previous mesage regarding the use  of AWZnode 0.4-pre2 was 
> not too clear. There are two commands that are relevant:
> 
> The 'send' command allows node users (typically incoming packet radio
> users) to deposit a message. The target of the message is a callsign.
> That callsign must be registered in node.users, where it is mapped to
> an existing local Linux user. The message is then delivered to that 
> user as E-mail (or it can be read from the AWZnode mailbox as per 
> below)
> 
> The other command is the 'mail' command, which opens a mailbox, very
> much like the one produced by the Linux 'mail' command. Once again,
> the packet radio user must be registered in node.users for this
> command to work. 
> 
> So, if a completely random ax25 user logs in, all they can do, is send
> a message to the sysop with 'send <sysop_callsign>, asking to create a 
> Linux account for them, and to make an entry for them in node.users. 
> 
> The latter maps their call to the Linux user, and allows them to use
> the AWZnode 'mail' command.
> 
> Whilst all of this works, a new caller cannot log in and leave a 
> message for another unregistered ax25 user, which, I guess, is what 
> Michael wanted his PMS/BBS to do. In any case: new ax25 users *can* 
> leave him a message.
> 
> Aside from all this, if you are running a multi-port ax25 setup,
> AWZnode is a worthwhile thing to have. It doesn't gobble up any
> resources as it is started from ax25d, and gives ax25 users the sort
> of this they usually want: a cross-port gateway, mheard facilities,
> telnet, ping etc. I have had it running here for quite a while and it
> is very well-behaved.
> 
> Wilbert, ZL2BSJ
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Bob Nielsen, N7XY                          n7xy@n7xy.net
Bainbridge Island, WA  
IOTA NA-065, USI WA-028S 
