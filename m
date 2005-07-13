From: Rodolfo Brasnarof <rodob@datafull.com>
Subject: Re: YAPP File Transfer with Linux
Date: Wed, 13 Jul 2005 09:39:15 -0300
Message-ID: <20050713093915.388987f9.rodob@datafull.com>
References: <20050712084205.55ec6610.rodob@datafull.com>
	<Pine.LNX.4.44.0507120900580.14121-100000@srv01.compumont.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0507120900580.14121-100000@srv01.compumont.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Tue, 12 Jul 2005 09:13:40 -0500 (CDT)
Bill Vodall wrote:

> 
> > Bill Vodall WA7NWP wrote:
> > 
> > > I'm looking for a command line YAPP file transfer
> > > facility for Linux.
> > 
> > Linpac does yapp transfers. I use it, and can upload or download
> > files from the local fbb bbs.
> > 
> > Linpac is a console packet terminal program. It seems like old dos
> > baycom program. It's mail support is not that good, but I like it.
> 
> Thanks for the reply.
> 
> Linpac might work as the client IF it can be scripted to do
> the transfer as part of a script with no user intervention.

I guess this could be done with linpac daemon (linpacd). Or perhaps you
could modify the call app to do a yapp transfer from the command line.
This should be possible (it supports yapp transfers, by a command).

