From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: Netrom
Date: Wed, 10 Jul 2013 00:34:30 +0200
Message-ID: <20130709223429.GD18314@x-berg.in-berlin.de>
References: <20130708115635.A4B233700A5@n1uro.ampr.org>
 <51DABEDA.8020905@junglevision.com>
 <1373314487.13641.19.camel@n1uro.ampr.org>
 <51DB9383.1050304@junglevision.com>
 <1373371546.6646.26.camel@n1uro.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1373371546.6646.26.camel@n1uro.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Rogers <n1uro@n1uro.ampr.org>
Cc: linux-hams <linux-hams@vger.kernel.org>, Cathryn Mataga <cathryn@junglevision.com>

On 2013-07-09 08:05:46 -0400, Brian Rogers <n1uro@n1uro.ampr.org>
wrote in <1373371546.6646.26.camel@n1uro.ampr.org>:
> Greetings;
> 
> On Mon, 2013-07-08 at 21:37 -0700, Cathryn Mataga wrote:
> 
> > Hmm, interesting that this would be an issue.   The Linux code does 
> > ignore a node if its best neighbor is one's self.    
> 
> That's fine, however it should also work in reverse;
> 
> NODEA <> NODEB <> NODEC
> If I am node c,  and I get a broadcast from node b that he has routing
> for node a, I should not send back to node b that node a exists on me.
> In fact, I should not broadcast back any nodes he's sent me at all to
> him. Doing such keeps non-existant nodes listed. For example if you
> search hard enough you'll find the nodes UROHUB and IPURO still being
> kept alive between xnet and linux systems on the internet. These nodes I
> used to run have not been in existance since June 2009.

Buggy software may the cause.

I think you're wrong with your assumtion, "I should not send back to
node b that node a exists on me."
Netrom is a broadcast protocol (we're talking about "it's broadcast" anyway).
It's designed, that multible nodes are on the same frequency, and broadcast
their knowledge abount the net. That means, NodeA rebroadcasts what he's
heard from NodeB and NodeC (with decreased quality, due to the algorithm
we've discussed before). And i.E. a NodeD (who hears only NodeA directly)
learns what NodeA broadcasts (that is, everything A has learned from B and C),

If NodeA has learned UROHUB with Quality 200, it calculates the new
quality (let's say 100) and broadcasts it. NodeB and NodeC will rebroadcast
it i.E. with quality 50.
If NodeA has no beacon heared from UROHUB, it times out (obsolescence timer).
NodeA will learn from NodeB and NodeC that the quality is 50, and computes
i.E. 25.
NodeB and NodeC will have to adjust the new quality, because they initialy
learned UROHUB from NodeA.
This count-to-zero may take some time (long time).
The worst_qual parameter helps to make this stop earlier.

Btw, I asked the maintainer of the TNN (TheNetNode) software. He says, that
that software has no capability to configure worst_qual (hardcoded 0).
TNN was used in north-west germany for many many years.

> > I wonder if there's 
> > a degenerate case, if 3 nodes all have their default_quality set to 255, 
> > where the 'neighbor' can all be the third station in the pair, and then 
> > the node broadcast just goes around and around for all eternity because 
> > the quality never decreases at all.
> 
> Misconfigured and mismatched systems will do this as well.
> 
> > In this equation,
> > 
> >   = ((quality * best_quality) + 128) /256;
> > 
> > Could it be that 128 is a mistake, in a world with so many ip based 
> > systems that set default quality at a high value. Without the 128 then a 
> > default_quality of 255 turn a 255 quality node into 254, so the infinite 
> > loop would end eventually.    


((255*255)+128)/256 = 254

=> It does decrease on the next hop and behind.

> > If we don't want to touch the code, maybe 
> > we should discourage anyone from ever setting a def_qual=255.  That this 
> > just seems likely to cause problems to me.
> 
> You're correct there, but don't you know the name of the game? (S)he
> with the most netrom nodes wins. Connectivity isn't the concern it's how
> much we can flood the screen with non-existant and non-connectable
> nodes. A good number of systems out there aren't maintained anymore but
> still exist, and others simply don't want to be bothered because in
> their eyes it's working so why fix it. 
> 
> In regards to the Xnet nodes, it uses a different formula for
> calculating quality if I'm not mistaken, and I don't believe you have
> the ability to set a min or even a default quality. It's been a while
> but I think it's based off of a sort of ping response and if it's quick
> (ie: inet) then it's obs are set to 6, and quality to 255. Again, I'm
> going off of memory and I have aged hi!

xnet (and tnn) people normaly use the netrom-derivate INP3, which scales
much better.

vy 73,
	- Thomas  dl9sau

> 
> -- 
> 73 de Brian Rogers - N1URO
> email: <n1uro@n1uro.ampr.org>
> Web: http://www.n1uro.net/
> Ampr1: http://n1uro.ampr.org/
> Ampr2: http://nos.n1uro.ampr.org
> Linux Amateur Radio Services
> axMail-Fax & URONode
> AmprNet coordinator for:
> Delaware, all New England, 
> and New Jersey.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
