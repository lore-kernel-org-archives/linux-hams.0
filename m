From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: AX25 tools and packages
Date: Thu, 2 Aug 2007 12:27:15 +0100
Message-ID: <20070802112715.GB25597@linux-mips.org>
References: <5abd436b0707261023nada8cf5n90532459745cd2ac@mail.gmail.com> <20070728133557.GA30168@linux-mips.org> <200708011705.21226.n7ipb@wetnet.net> <20070802012451.GA1238@cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20070802012451.GA1238@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, Aug 02, 2007 at 11:24:51AM +1000, Hamish Moffatt wrote:

> > I'm using the latest patches from Debian since that seemed to be the latest 
> > I could find.  Because my current builds are targeted at a 2.4 series kernel in
> > an embedded system they work with a few small patches but I'm planning
> > on switching to 2.6 as soon as possible.
> 
> There appears to be a misconception that 2.6 requires new tools. Notice
> that Ralf said newer Linux distributions (meaning newer libc, gcc etc)
> rather than newer kernels.

Correct.  Binary compatibility across kernels is one of the holy grails
in Linux and AX.25 is not exception to that.  Unfortunately that's a
little different for source code of the tools which at times may need a
little update to compile on a more recent system.

73 de DL5RB op Ralf

--
Loc.    JN47BS / CQ 14 / ITU 28 / DOK A21
Packet: DL5RB@DB0FHN.#BAY.DEU.EU
