From: csmall@eye-net.com.au (Craig Small)
Subject: Re: AX25 socket question.
Date: Wed, 17 Jul 2002 15:46:12 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020717054612.GA16773@eye-net.com.au>
References: <20020715052433.18187.h005.c002.wm@mail.peoplepc.com.criticalpath.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020715052433.18187.h005.c002.wm@mail.peoplepc.com.criticalpath.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: TIMOTHY POWELL <kd4iky@peoplepc.com>
Cc: linux-hams@vger.kernel.org

On Mon, Jul 15, 2002 at 05:24:29AM -0700, TIMOTHY POWELL wrote:
> What I?m wanting to do is write a program to monitor
> local packet activity.  The main goal is to learn
> something new and I thought writing packet applications
> would be a good start.  From your explanation and from
> what I learned this weekend is that listen, listens to
> more than just AX25 information which is way more than
> I want to do.
Yes, you have to work out what layer you want.  listen listens at 
the packet layer which is pretty well everything.  You then take a
random string of bytes and decode it.  Listen is effectively a very dumb
set of protocol stacks, you could consider it a lite version of the
actual protocol stack in the kernel itself.

> So PF_AX25 is the domain, SOCK_SEQPACKET would be the
> type of communication.  So what protocol is used for
> receiving AX25 information, or am I still
> misunderstanding sockets?

If you are in the land of PF_AX25 you are now talking about a *specfic*
sequence of packets, in other words a single connection.  You'd use this 
sort of socket to connect to another AX.25 station or to make a daemon
like ax25d.  The point is that there is a stream of packets to/from
you and a remote station and this socket is your end of that stream.
The protocol stack in the kernel (essentially between the packet socket
and the ax25 socket) does all the address handling, filtering and
reording for you.

> Here might be a better idea of what I?m trying to do. 
> I got an old PC that I put linux on with AX25 turned
> on, for lack of a better description.  I plan to use
> the sound card to receive and send packets.  First
> thing I wanted to do was to write an application for
> monitoring the local packet activity.  Then move to
> more difficult programs as I learn more about it.  Are
> there any tutorials or documentation specific to AX25
> that I could also read along with studying the listen
> code?  Thanks for your help.  I hope this gives you a
> better idea of what I want to do.
OK monitoring local packet activity means you want to do something like
what listen does, so its down to the packet layer for that.  While I
called it dumb, listen is quite complex and has a specific task.  I'm
not sure if you'd want to go to all that trouble.

I've used the low level sockets for strange programs such as
 - network analyzers like listen
 - weirdo programs like axdigi
 - routing daemons like rspfd

but they are strange and are the exception rather than the rule on how
most programs related to ax25 are used. People that store useless
information may even know the connection of the three (with the
exception of my involvement).

  - Craig

-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.eye-net.com.au/        <csmall@eye-net.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
