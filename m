From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: net/* module-related oddities
Date: Tue, 24 Feb 2004 02:18:36 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040224011836.GC12982@linux-mips.org>
References: <20040221011854.GM31035@parcelfarce.linux.theplanet.co.uk> <20040220184049.22bf1814.davem@redhat.com> <20040221044144.GN31035@parcelfarce.linux.theplanet.co.uk> <20040221130234.575505fc.davem@redhat.com> <20040223193744.E235@jeroen.pe1rxq.ampr.org> <20040223211916.GB31035@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040223211916.GB31035@parcelfarce.linux.theplanet.co.uk>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: Jeroen Vreeken <pe1rxq@amsat.org>, "David S . Miller" <davem@redhat.com>, linux-hams@vger.kernel.org, acme@conectiva.com.br

On Mon, Feb 23, 2004 at 09:19:17PM +0000, viro@parcelfarce.linux.theplanet.co.uk wrote:

> > AX25_P_NETROM for instance is the PID netrom packets use when encapsulated
> > in an ax25 connection.
> > When the netrom code is present it indeed registers AF_NETROM, but this is
> > for its own socket interface. From that moment on AF_AX25 users should be
> > prevented from opening ax25 connections with the netrom PID.
> 
> "From that moment on" in this case sounds like a recipe for races.
> 
> What happens if connections is opened _before_ insmod netrom?  Once
> netrom is loaded, we are in the situation you've tried to prevent.
> 
> You either need to make insmod netrom fail if there's such open socket
> or you have to make netrom survive its presense.  Pick one...

These checks are all papering over insufficiencies in the lower layers of
the AX.25 stack.  I'm working on removing the CONFIG_${OTHER_PROTOCOL}
stuff alltogether; there simly should not be such dependencies.

  Ralf
