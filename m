From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [PATCH] SMP fix for 6pack driver
Date: Thu, 7 Jul 2005 11:46:07 +0100
Message-ID: <20050707104607.GD2822@linux-mips.org>
References: <20050705181222.GB18772@linux-mips.org> <Pine.LNX.4.44.0507051738350.14175-100000@srv01.compumont.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0507051738350.14175-100000@srv01.compumont.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Vodall <wa7nwp@jnos.org>
Cc: linux-hams@vger.kernel.org

On Tue, Jul 05, 2005 at 05:39:44PM -0500, Bill Vodall wrote:

> > It's a strategy that allows attaching the TNC to any UNIX machine,
> > even without AX.25 support.  It's a hack but I was playing with it
> > for a while when I ran out of interfaces.
> 
> That could be VERY userful...   Any more details available?

6pack is implemented as a line discipline, so any tty, including a pseudo
tty can be turned into a 6pack interface.  So all it takes is a network
connection, let's say through ssh, an application on the remote side that
transfers data on the remote side between that connecton and the
/dev/tty... character device to which the TNC is connected.  Same thing
also on the local side, just between the pseudo-tty and the filedescriptor.
Pretty much a nobrainer to implement but latency could be a slight
problem.

(And if you don't truncate the cc list of email you even have a chance to
getting answers in time ...)

  Ralf
