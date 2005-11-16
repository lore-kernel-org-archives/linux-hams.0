From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: YAM/Tekk help
Date: Wed, 16 Nov 2005 16:29:53 +0000
Message-ID: <20051116162953.GI3229@linux-mips.org>
References: <20051116151748.GN3241@goldengate.vpizza.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20051116151748.GN3241@goldengate.vpizza.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Meehan <jmeehan@vpizza.org>
Cc: linux-hams@vger.kernel.org

On Wed, Nov 16, 2005 at 07:17:48AM -0800, Jim Meehan wrote:

> If I ping from either side, that machine sends out ARP requests endlessly.
> If I do "ifconfig" on the other side, I can see the RX packet counter
> incrementing, and in "listen" I can see the ARP requests being received.
> But no ARP reply is ever sent.  If I create a static ARP entries on both sides,
> then the machines can find each other, and I can ping in both directions.
> I guess it's not really such a problem to add static ARP entries on both sides,
> since there won't be any stations other than these two.  Would be nice to
> know why ARP isn't working though.

It this IP over raw AX.25 or IP over NET/ROM?  ARP works over AX.25 but
not over NET/ROM.  Anyway, the majority of sites deciede to disable ARP
and use static ARP tables simply because ARP uses some bandwidth and 9k6
isn't exactly alot.

  Ralf
