From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: net/* module-related oddities
Date: Tue, 24 Feb 2004 16:50:32 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040224165032.A201@jeroen.pe1rxq.ampr.org>
References: <20040221011854.GM31035@parcelfarce.linux.theplanet.co.uk> <20040220184049.22bf1814.davem@redhat.com> <20040221044144.GN31035@parcelfarce.linux.theplanet.co.uk> <20040221130234.575505fc.davem@redhat.com> <20040223193744.E235@jeroen.pe1rxq.ampr.org> <20040223211916.GB31035@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040223211916.GB31035@parcelfarce.linux.theplanet.co.uk>; from viro@parcelfarce.linux.theplanet.co.uk on Mon, Feb 23, 2004 at 22:19:17 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: Jeroen Vreeken <pe1rxq@amsat.org>, "David S . Miller" <davem@redhat.com>, ralf@linux-mips.org, linux-hams@vger.kernel.org, acme@conectiva.com.br

On 2004.02.23 22:19:17 +0100 viro@parcelfarce.linux.theplanet.co.uk wrote:
> On Mon, Feb 23, 2004 at 07:37:44PM +0100, Jeroen Vreeken wrote:
> > AX25_P_NETROM for instance is the PID netrom packets use when
> encapsulated
> > in an ax25 connection.
> > When the netrom code is present it indeed registers AF_NETROM, but this
> is
> > for its own socket interface. From that moment on AF_AX25 users should
> be
> > prevented from opening ax25 connections with the netrom PID.
> 
> "From that moment on" in this case sounds like a recipe for races.
> 
> What happens if connections is opened _before_ insmod netrom?  Once
> netrom is loaded, we are in the situation you've tried to prevent.
> 
> You either need to make insmod netrom fail if there's such open socket
> or you have to make netrom survive its presense.  Pick one...

It will survive... The open socket will simply seize to get data since that
will from that moment on go to the netrom stack.

The major thing wrong with it at the moment is that it tries to do magic
with the compile time config options. Thats a big mistake (those config
options don't tell you anything about the real system state you end up
with).

The second thing wrong is that it 'knows' which protocols you might run
over ax25.
It simply doesn't, as I noted in my previous mail it should just check if
the protocol is registered and if it is deny the socket access.

As for the race I would opt for a third option: during insmod netrom will
register its protocol and ax25 will at that point close any open sockets
using the same protocol id.
The netrom protocol handled by the netrom stack has always been the 'usual'
behaviour and I don't even know about programs trying to open sockets with
the netrom pid.

Jeroen

