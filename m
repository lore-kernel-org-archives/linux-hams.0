From: Ralf Baechle DL5RB <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Subject: Re: [PATCH] packet.7: Describe SOCK_PACKET netif name length issues
 and workarounds.
Date: Thu, 29 Jul 2021 08:05:25 +0200
Message-ID: <YQJFJWP5MnWrJr34@linux-mips.org>
References: <YP/Jcc4AFIcvgXls@linux-mips.org>
 <a050e248-af45-0678-b25c-27e249fb5565@gmail.com>
Mime-Version: 1.0
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a050e248-af45-0678-b25c-27e249fb5565-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Alejandro Colomar (man-pages)" <alx.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hams-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Osterried <thomas-SbBNwotClTQPyMaTEpOvjQ@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Jul 28, 2021 at 10:52:15PM +0200, Alejandro Colomar (man-pages) wrote:

> Hello Ralf,
> 
> On 7/27/21 10:53 AM, Ralf Baechle wrote:
> > Describe the issues with SOCK_PACKET possibly truncating network interface
> > names in results, solutions and possible workarounds.
> > 
> > While the issue is know for a long time it appears to have never been
> > documented properly and is has started to bite software antiques badly since
> > the introduction of Predictable Network Interface Names.  So let's document
> > it.
> > 
> > Signed-off-by: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
> 
> Thanks for the patch!
> Please see a few comments below.

I'll make an updated version in a week or so.  Until then I'm goning to be
offline on civil defence duty in German's flood disaster region ...

  Ralf
