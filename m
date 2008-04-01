From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: What were the reasons of having IP address at AX.25 interfaces ?
Date: Tue, 1 Apr 2008 10:17:26 +0200
Message-ID: <20080401081726.GB4491@x-berg.in-berlin.de>
References: <S3540591AbYBCSQN/20080203181613Z+1592@mail.zmailer.org> <20080331215048.GB21500@linux-mips.org> <20080331220829.GO3700@mea-ext.zmailer.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080331220829.GO3700@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matti Aarnio <matti.aarnio@zmailer.org>
Cc: Ralf Baechle DL5RB <ralf@linux-mips.org>, linux-hams@vger.kernel.org

> > A while ago I was curious myself for why that is needed and dug into
> > the CVS history.  I found the IP address wasn't always enforced and the
> > commit message didn't really explain why the change was needed.
> > 
> > 73 de DL5RB op Ralf
> 
> I figured it eventually myself, and rewrote  libax25's
> axconfig/rsconfig/nrconfig functions to not to require IP addresses
> in AX.25/Netrom/Rose interfaces to be able to find all interface
> currently defined.

I think it was a design problem, because the used system call only
shows those interfaces which are up. 
My approach is, to use /proc to find them, inspired by the "ifconfig" tool
(if i remember correctly).
This simply enhances get_ax25_ifaces() by this method. The code is in
the CVS version, but not enabled by default (-DFIND_ALL_INTERFACES).

I hat no problems with it on kernel 2.6. But on kernel 2.4., i observed
that when an incoming SABM occurs, the kernel did panic.

73,
	- Thomas  dl9sau
