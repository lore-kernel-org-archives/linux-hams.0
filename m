From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: net/* module-related oddities
Date: Mon, 23 Feb 2004 19:37:44 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040223193744.E235@jeroen.pe1rxq.ampr.org>
References: <20040221011854.GM31035@parcelfarce.linux.theplanet.co.uk> <20040220184049.22bf1814.davem@redhat.com> <20040221044144.GN31035@parcelfarce.linux.theplanet.co.uk> <20040221130234.575505fc.davem@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040221130234.575505fc.davem@redhat.com>; from davem@redhat.com on Sat, Feb 21, 2004 at 22:02:34 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S . Miller" <davem@redhat.com>
Cc: viro@parcelfarce.linux.theplanet.co.uk, ralf@linux-mips.org, linux-hams@vger.kernel.org, acme@conectiva.com.br

On 2004.02.21 22:02:34 +0100 David S. Miller wrote:
> On Sat, 21 Feb 2004 04:41:44 +0000
> viro@parcelfarce.linux.theplanet.co.uk wrote:
> 
> > 	What is intended there?  Is it "netrom already speaks that
> protocol
> > and it would be unhappy if you try to interfere"?  Then the first case
> above
> > is a bug - we can get netrom loaded and such socket opened.  If it's
> not that,
> > WTF it is?
> 
> It cannot be because of a protocol handling conflict.  NETROM registers
> AF_NETROM, AX25 registers AF_AX25, and ROSE registers AF_ROSE.
> 
> I think all of these tests are simply backwards.  What it wants to do is
> say ESOCKTNOSUPPORT if the netrom/rose/etc. protocols aren't present or
> their module type can't be loaded, during ax25_create().

No it is checking for conflicts...

AX25_P_NETROM for instance is the PID netrom packets use when encapsulated
in an ax25 connection.
When the netrom code is present it indeed registers AF_NETROM, but this is
for its own socket interface. From that moment on AF_AX25 users should be
prevented from opening ax25 connections with the netrom PID.

There is however a serious flaw in it....
Atleast some duplication as it checks twice for the presence of netrom.
This should be done only once.
The rose checks can also be done in one pass:

	if (ax25_protocol_is_registered(protocol))
		return -ESOCKNOTSUPPORT;

This way the code doesn't need to know which protocols might be supported,
it only has to see if another part of the kernel has registered it at the
ax25 layer and it will prevent users from touching it.
 
> This code has been like this for centuries, I'm so scared to touch it.
> 
> Ralf, since you're the listed AX.25/ROSE/NETROM maintainer :)  Take a
> look
> at the crap happening in ax25_create(), all thoses tests about SEQPACKET
> sockets and IP, ROSE, NETROM.  They all look reversed.  They have to be,
> if not neither I nor Al here have any idea what the code is trying to do.

The only one I am not sure about is the PF_AX25 stuff.
Right now the user can call with protocol set to either 0, PF_AX25 or
AX25_P_TEXT and will end up with a AX25_P_TEXT on air PID.
I am not sure which of the three is intended to be the correct one or which
is only there for backward compatibility.

The AX25_P_SEGMENT case is clear, the segmented packets can when stuck
together again represent any other packet and are handled by the ax25 stack
itself, users have no business there.

The AX25_P_IP and AX25_P_ARP are similar, these are passed to and from the
kernel IP stack and users should mess with them unless they go through the
IP stack.

(We always have the raw packet interface for users really wanting to mess
with the network interfaces themselves.)

Jeroen


