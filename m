From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: net/* module-related oddities
Date: Mon, 23 Feb 2004 21:19:17 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040223211916.GB31035@parcelfarce.linux.theplanet.co.uk>
References: <20040221011854.GM31035@parcelfarce.linux.theplanet.co.uk> <20040220184049.22bf1814.davem@redhat.com> <20040221044144.GN31035@parcelfarce.linux.theplanet.co.uk> <20040221130234.575505fc.davem@redhat.com> <20040223193744.E235@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040223193744.E235@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: "David S . Miller" <davem@redhat.com>, ralf@linux-mips.org, linux-hams@vger.kernel.org, acme@conectiva.com.br

On Mon, Feb 23, 2004 at 07:37:44PM +0100, Jeroen Vreeken wrote:
> AX25_P_NETROM for instance is the PID netrom packets use when encapsulated
> in an ax25 connection.
> When the netrom code is present it indeed registers AF_NETROM, but this is
> for its own socket interface. From that moment on AF_AX25 users should be
> prevented from opening ax25 connections with the netrom PID.

"From that moment on" in this case sounds like a recipe for races.

What happens if connections is opened _before_ insmod netrom?  Once
netrom is loaded, we are in the situation you've tried to prevent.

You either need to make insmod netrom fail if there's such open socket
or you have to make netrom survive its presense.  Pick one...
