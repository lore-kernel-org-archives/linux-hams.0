From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: fbb, progress and questions
Date: Thu, 9 Jan 2003 16:40:12 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200301091640.12860.vk3bvp@qsl.net>
References: <Pine.LNX.4.44.0301082249560.27870-100000@jeeves.mvw.net>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0301082249560.27870-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Thu, 9 Jan 2003 15:08, mvw@mvw.net wrote:
> Hello all,
>
> Well, a week further and some progress on fbb... but it is rather hard
> going - for someone used to the Internet and smtp etc, this is all a tad
> counterintuitive, and the documentation is rather obtuse, so bear with
> me... I have so many questions I don't know where to start... I will not
> bore you but just to give you a flavour of BASIC stuff I just cannot find
> documented, and yes, before you ask, I have read the docs (or tried to) on
> the f6fbb.org site..:
>
> - How does this "forwarding" work??

similar to smtp and nntp, but a different protocol.

> - What are messages vs bulletins vs private messages etc?

You've got bulletins and personal messages.
Like you have news and email on the Internet.

> - when a message is "on hold", how do I get it "off hold"?

something like eh, er or lh. It's been a long time. Anything that might want 
an H in reject.sys just gets an R. I'm not going to muck around checking 
dubious posts.

> - Why does killing a message not remove it? How DO I remove it?

It should get deleted during housekeeping. you could try using kk (extra k as 
it says when you type ? k).

> - How does a node I forward to, allow/know/handle this?

You don't forward to nodes. allow/know/handle what ???

> - Why do I have one password set with "EU" command and one in passwd.sys,
> and never the twain shall meet?

Dunno. I use passwd.sys

> - ehy can I not use the "EU" command when telnetted in, but I can use it
> when using the xfbbC app?

I don't use telnet.

> - the forward file apprently needs a degree of knowledge that is beyond
> me: so, any examples?

Using kernel ax25.

A simple direct connect to my JNOS.
#
A jnos
P D
J 0
N
IF H 00-23
    C C VK3BVP-13
ENDIF
B TCPIP
F TCPIP
B VK3BVP
F VK3BVP
F VK3WRE
#H QSL.NET
G ALL
G AMSAT
G ARL
G ARRL
G AS
G ASIA
G GIPPS
G PAC
G TCPIP
G VK3
G VKNET
G WW
G NASA
G TEST
-----------

Forward to a remote BBS using netrom.
#                          forward for edk
A VK3EDK
P A
L B 235
L N 4
#IF H 20-23
#   T P
#ENDIF
IF MAN
#T P
    C C VK3BXG-2
    C C VK3EDK
ELSE
IF C1
   C C VK3bxg-2
   C C VK3EDK
END IF
ENDIF
#
F VK3DSE
B VK3DSE
F VK3EDK
B VK3EDK
! H VK3FRC.#MEL.VIC.AUS.OC
! H VK3ZZT.#MEL.VIC.AUS.OC
! H VK3YBI.#MEL.VIC.AUS.OC
H *.#MEL.VIC.AUS.OC
H *.#WEV.VIC.AUS.OC
H *.#NEV.VIC.AUS.OC
H *.ACT.AUS.OC
G AMSAT
G ARL
G ARRL
G ASIA
G MELB
G NASA
G PAC
G SEA
G SPACE
G VK3
G AUS
G VKNET
G WIA
#G WW
#G GIPPS
#R
---------------

A tip: Don't be like the idiot LLL's and put asterisks in your forward 
scripts. It just means that the rest of us have to fix your mistakes.


> - What are white pages (the docs just say this is an interesting
> implementation of white pages)?

That's like your phone book. Saves a lot of typing as it does what you want 
below when you send a message. FBB will (can) send updates to their BBS's to 
keep their white pages up to date.

> - How do I get bulletins in? And out?

Forwarding.

> - Using EU, can I not change someone's home bbs?

Have a play with "ie callsign"

> - Is there a 'phone book', so I do not have to type SP <call> @
> ve3mch.#scon.on.can.noam or some such string each time?

See above.

> - Many programming techniques that are used in fbb are extremely poor
> (sorry! do not mean to be rude, but just wondering WHY).  Like using
> binary configuration settings (2, 4, 8, 16, 32, etc); or using setup files

I have other software that also does it that way.

> that depend on exact numbers of lines, etc. Is this historical accident?

Some files have moved away from that in the linux version. Maybe one day they 
all will.

> - I guess fbb does its own ax25 thing - why not just use kernel ax25?

It does. I only use ports provided by the kernel.
You have choices. You are not forced to do it this way or that way.

>
>
> As you see, my lack of understanding is so great that I wonder if I will
> ever usefully use this.

Probably not, but have a go anyway.

> So rather than bore you with too many questions
> about the detail, a few meta questions, namely: is this all part of the
> normal learning process, or am I overlooking some good basic docs
> somewhere? (Or am I too dumb)? Should I bother? And, if yes, what is the
> best way to find info (not the docs, apparently).

You have asked a lot of basic questions over the last few weeks and seem to 
get stuck easily. But maybe the rest of us have been there, done that for too 
long and we take too much for granted.
The docs do contain a lot of info. you just have to read the right ones.
Have a look at the DOS and windows docs too.

-- 
Shane Deering   vk3bvp@qsl.net 	vk3bvp@vk3bvp.#sev.vic.aus.oc
http://www.qsl.net/vk3bvp/		Up 5 hours and 13 minutes 
Sent with KMail v1.4.1 on Thu Jan  9 15:55:07 EST 2003

