From: "David S. Miller" <davem@redhat.com>
Subject: Re: net/* module-related oddities
Date: Sat, 21 Feb 2004 13:02:34 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040221130234.575505fc.davem@redhat.com>
References: <20040221011854.GM31035@parcelfarce.linux.theplanet.co.uk>
	<20040220184049.22bf1814.davem@redhat.com>
	<20040221044144.GN31035@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040221044144.GN31035@parcelfarce.linux.theplanet.co.uk>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: ralf@linux-mips.org, linux-hams@vger.kernel.org, acme@conectiva.com.br

On Sat, 21 Feb 2004 04:41:44 +0000
viro@parcelfarce.linux.theplanet.co.uk wrote:

> 	What is intended there?  Is it "netrom already speaks that protocol
> and it would be unhappy if you try to interfere"?  Then the first case above
> is a bug - we can get netrom loaded and such socket opened.  If it's not that,
> WTF it is?

It cannot be because of a protocol handling conflict.  NETROM registers
AF_NETROM, AX25 registers AF_AX25, and ROSE registers AF_ROSE.

I think all of these tests are simply backwards.  What it wants to do is
say ESOCKTNOSUPPORT if the netrom/rose/etc. protocols aren't present or
their module type can't be loaded, during ax25_create().

This code has been like this for centuries, I'm so scared to touch it.

Ralf, since you're the listed AX.25/ROSE/NETROM maintainer :)  Take a look
at the crap happening in ax25_create(), all thoses tests about SEQPACKET
sockets and IP, ROSE, NETROM.  They all look reversed.  They have to be,
if not neither I nor Al here have any idea what the code is trying to do.

Thanks.
