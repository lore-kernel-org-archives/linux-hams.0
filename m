From: csmall@eye-net.com.au (Craig Small)
Subject: Re: AX25 socket question.
Date: Mon, 15 Jul 2002 10:03:08 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020715000308.GA16191@eye-net.com.au>
References: <20020714120112.23833.h011.c002.wm@mail.peoplepc.com.criticalpath.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020714120112.23833.h011.c002.wm@mail.peoplepc.com.criticalpath.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: TIMOTHY POWELL <kd4iky@peoplepc.com>
Cc: linux-hams@vger.kernel.org

On Sun, Jul 14, 2002 at 12:01:11PM -0700, TIMOTHY POWELL wrote:
> Got a question about the below code copied from the
> listen.c file that came with ax25-apps-0.0.4
> 
> if ((s = socket(AF_PACKET, SOCK_PACKET, htons(proto)))

listen is doing a low-level (Packet socket) connection.  This is because
it wants to receive all traffic.  Quite often you don't want something
as low-level as that.

> I'm new to sockets so I'm a little confuse.  From what
> i read from the man pages about sockets if i want to
> create a socket for ax.25 I would do something similar
> to the following:
> 
> axsock = socket(PF_AX25, SOCK_STREAM, <?>) ;

This would make a socket with the protocol family of AX25 and a type of
STREAM.  AX.25 connections are usually SOCK_SEQPACKET  I don't think
STREAMs are defined in AX25 land.

> I am assuming that AF_PACKET and SOCK_PACKET, used in
> the first piece of code, are just variables used by the
> programmer to create any type socket he wanted, since I
> couldn't find metion of them in the man pages or any
Not really, it comes to what protocol level the packets come in at.
PACKET is pretty low level, I think SOCK_RAW is lower still though I
cannot see the difference between them.

> way i wrote the function except for <?> if all i want
> to do is create a socket for AX25?  <?> is where the
Create a socket for AX25 to do WHAT?  The what is the essential piece of
information you are missing and it what we need to help you.

>  I tried to find the function 
> htons(proto) in the code but couldn't so I'm not sure
htons? Host to Network (byte order) for Short ints?
Makes sure the bits are the right way around, intel gets them back to
front.

> which protocol to use with AX25.  I looked in the file
> /ect/protocols but didn't see anything for AX25, but
/etc/protocols are the protocols that ride on top of IP
As you're playing around "below" IP so it won't help you.

As someone said before, have a look at the existing code.  It may not be
perfect but it works and gives you a good start.  I can tell you more
specific things to look at once we know what you're trying to do.

 - Craig
-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.eye-net.com.au/        <csmall@eye-net.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
