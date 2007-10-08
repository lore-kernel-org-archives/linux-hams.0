From: Stephen Hemminger <shemminger@linux-foundation.org>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Mon, 8 Oct 2007 09:55:22 -0700
Message-ID: <20071008095522.5c68aacf@freepuppy.rosehill>
References: <47093A4E.5040409@hamradio.hr>
	<20071008104541.GA4924@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20071008104541.GA4924@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: Tihomir Heidelberg - 9a4gl <9a4gl_MAKNI_OVO@hamradio.hr>, linux-hams@vger.kernel.org

On Mon, 8 Oct 2007 11:45:41 +0100
Ralf Baechle DL5RB <ralf@linux-mips.org> wrote:

> On Sun, Oct 07, 2007 at 09:58:06PM +0200, Tihomir Heidelberg - 9a4gl wrote:
> 
> > Using kernel 2.6.21.6 here. If you write to AX.25 socket bytes more then
> > MTU, write will return -1 and errno will be set to 90 (EMSGSIZE =
> > [Message too long]).
> > 
> > This happend in net/ax25/af_ax25.c in function ax25_sendmsg at:
> > 
> >         if (len > ax25->ax25_dev->dev->mtu) {
> >                 err = -EMSGSIZE;
> >                 goto out;
> >         }
> 
> This is a Linux 2.6.2 change, I append the patch which introduced the
> change below.  I'm cc'ing Stephen Hemminger who hopefully recalls why his
> patch did introduce this change.
> 
>
I have no memory of adding this, as long as lower layers handle it
the check should be there.

> > Also, as I see, currently ax25 stack is not checking if dev_queue_xmit
> > fails. Does this means that AX.25 kernel can loose some frames when
> > device queue is full ?  
> 
> Yes.  This isn't a bug - packet delivery is unreliable.  But what I'd
> really like to see is the AX.25 stack to throttle itself instead of
> continuing to stuff packets into an overflowing queue.

The traditional definition of X.25 was reliable (except for network
resets), so it seems odd that AX.25 would change that. It might be that
AX.25 doesn't really implement traditional X.25 but just uses the formatting
and framing??

-- 
Stephen Hemminger <shemminger@linux-foundation.org>
