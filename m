From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: What were the reasons of having IP address at AX.25 interfaces
	?
Date: Tue, 1 Apr 2008 12:44:45 +0300
Message-ID: <20080401094445.GR3700@mea-ext.zmailer.org>
References: <S3540591AbYBCSQN/20080203181613Z+1592@mail.zmailer.org> <20080331215048.GB21500@linux-mips.org> <20080331220829.GO3700@mea-ext.zmailer.org> <20080401081726.GB4491@x-berg.in-berlin.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080401081726.GB4491@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: Matti Aarnio <matti.aarnio@zmailer.org>, Ralf Baechle DL5RB <ralf@linux-mips.org>, linux-hams@vger.kernel.org

On Tue, Apr 01, 2008 at 10:17:26AM +0200, Thomas Osterried wrote:
> > > A while ago I was curious myself for why that is needed and dug into
> > > the CVS history.  I found the IP address wasn't always enforced and the
> > > commit message didn't really explain why the change was needed.
> > > 
> > > 73 de DL5RB op Ralf
> > 
> > I figured it eventually myself, and rewrote  libax25's
> > axconfig/rsconfig/nrconfig functions to not to require IP addresses
> > in AX.25/Netrom/Rose interfaces to be able to find all interface
> > currently defined.
> 
> I think it was a design problem, because the used system call only
> shows those interfaces which are up. 

Are up and with IP addresses.  I am not 100% sure that the used ioctl()
misbehaves in this regard.

> My approach is, to use /proc to find them, inspired by the "ifconfig" tool
> (if i remember correctly).

I wrote similar code myself, and turned the logic of the whole axconfig.c
upside down in order to scan files only once, nor build 

> This simply enhances get_ax25_ifaces() by this method. The code is in
> the CVS version, but not enabled by default (-DFIND_ALL_INTERFACES).
> 
> I hat no problems with it on kernel 2.6. But on kernel 2.4., i observed
> that when an incoming SABM occurs, the kernel did panic.

And recently people have observed kernel panics with ROSE traffic..
Permanently avoiding using some machinery because it breaks for some
users is not a good thing in my mind ..  those broken things will never
get fixed if we don't find them, and report them.


I use only AX.25 UI traffic myself (APRS), thus those SABM problems do
not bite me, but for rare CONS users they are troublesome things indeed..


> 73,
> 	- Thomas  dl9sau

  /Matti Aarnio - OH2MQK
