From: Riley Williams <rhw@MemAlpha.cx>
Subject: Re: about ax25ipd
Date: Fri, 19 Apr 2002 18:44:41 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0204191836480.22444-100000@Consulate.UFP.CX>
References: <Pine.LNX.4.33.0204190135420.2514-100000@localhost.localdomain>
Reply-To: Riley Williams <rhw@InfraDead.Org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0204190135420.2514-100000@localhost.localdomain>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Saiz Villoria <ea1apm@amsat.org>
Cc: Linux Ham Radio <linux-hams@vger.kernel.org>

Hi Ricardo.

> I will try and see the packets with tcpdump. But linux itself can
> snnif all the traffic in the network, not just that from other
> computers but also his own packets. I don't think a tcpdump
> equivalent is needed in the other computers.

Whilst in theory Linux can do just that, in practice it doesn't always
do so. However, from a diagnostics viewpoint, the tcpdump wants to be
running on a machine other than the two having the problem, as one can
then guarantee that it sees everything on the network, including the
results of hardware problems on the ethernet adapters in the two
machines (something that will NEVER show up to the machines themselves).

To localise the problem as much as possible, I'd start by filling in a
table stating exactly which machine can connect to which other
machine. Something along the lines of the following:

 A. Does LINUX connect to MSDOS ?             Yes  /  No
 B. Does LINUX connect to WIN2K ?             Yes  /  No
 C. Does LINUX connect to WIN9X ?             Yes  /  No

 D. Does MSDOS connect to LINUX ?             Yes  /  No
 E. Does MSDOS connect to WIN2K ?             Yes  /  No
 F. Does MSDOS connect to WIN9X ?             Yes  /  No

 G. Does WIN2K connect to LINUX ?             Yes  /  No
 H. Does WIN2K connect to MSDOS ?             Yes  /  No
 I. Does WIN2K connect to WIN9X ?             Yes  /  No

 J. Does WIN9X connect to LINUX ?             Yes  /  No
 K. Does WIN9X connect to MSDOS ?             Yes  /  No
 L. Does WIN9X connect to WIN2K ?             Yes  /  No

Also, don't assume that because A can connect to B, it automatically
means that B can connect to A as that often isn't the case. That's why
there are 12 tests above.

> The problems seems to be either the ms-dos card driver or flexnet
> axip driver not accepting the packets for some reason.

It's also possible that there's a hardware problem with one of the
cards, in which case the above should show it up.

Best wishes from Riley.

