From: Ken Koster <n7ipb@koster.seatcp.net>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Sat, 27 Jul 2002 06:38:43 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200207270637.01098.n7ipb@koster.seatcp.net>
References: <001401c2355e$2ef96750$e239832c@jrws2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001401c2355e$2ef96750$e239832c@jrws2>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Jenkins <raj@jrw.co.uk>, 'Ralf Baechle DO1GRB' <ralf@uni-koblenz.de>, linux-hams@vger.kernel.org

On Saturday 27 July 2002 04:10, Robert Jenkins wrote:
> Hi Ralf & all,
>
>
> There is one item on my Wishlist which I've mentioned a couple of times
> in the group;

And a couple on mine that I've done on my local systems.

The count of total bytes sent and received.  The net_device_stats structure
has a place for rx and tx_bytes, but mkiss and other drivers don't make use
of them.  In the case of mkiss the mod is simple and I'm sure it's not that
hard for other device drivers.

Also, mkiss, and probably other drivers are not initializing the interface
flags correctly.  They need to indicate that these drivers can do broadcasts.
The change is a one liner.

It sounds like we have several people who've been digging into the kernel 
code.  Do we perhaps need to make a real project of this, with a common 
place for the code and CVS to keep track of the changes?  We could do this 
as a sourceforge project, or if everyone would rather keep this small, at 
least setup a CVS account somewhere that could keep track of changes.  I 
could probably be talked into hosting such if needed.

Ken,  N7IPB 
