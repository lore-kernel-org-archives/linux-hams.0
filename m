From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: AX25 in UBUNTU Breezy
Date: Fri, 18 Nov 2005 12:33:05 +0000
Message-ID: <20051118123305.GB2707@linux-mips.org>
References: <1b38301c5ec27$41874170$0a05030a@internal.ramnet.gr> <20051118100905.GA25862@cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20051118100905.GA25862@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Fri, Nov 18, 2005 at 09:09:05PM +1100, Hamish Moffatt wrote:

> > If yes could you tell me which versions of are working for you? UBUNTU 5.10 has kernel 2.6.12 and when I try MKISS I get input/output error. I had SLACKWARE 10.2 with kernel 2.4.31 before and AX25 worked.
> 
> I found that the kernel crashed when I ran kissattach with 2.6.12.
> You need 2.6.14 at least.

2.6.12 had a particularly broken mkiss, unfortunately.  So I'd probably
recommend any earlier or later version of 2.6.

  Ralf
