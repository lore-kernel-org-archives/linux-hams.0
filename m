From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 1/1] Force mkiss to reset the line discipline when serial
 device is removed
Date: Thu, 1 Oct 2015 09:31:18 +0200
Message-ID: <20151001073117.GA31401@linux-mips.org>
References: <560C6A79.4070400@eclis.ch>
 <1443668180-1283-1-git-send-email-jc@eclis.ch>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443668180-1283-1-git-send-email-jc@eclis.ch>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jc@eclis.ch
Cc: Thomas Osterried <thomas@osterried.de>, David Ranch <dranch@trinnet.net>, linux-hams@trinnet.net, linux-hams@vger.kernel.org

On Thu, Oct 01, 2015 at 04:56:20AM +0200, jc@eclis.ch wrote:

> From: Jean-Christian de Rivaz <jc@eclis.ch>
> 
> Without the TTY_DRIVER_RESET_TERMIOS in the tty driver flags, the
> ax_open() is called again and a new unconfigured interface replace the
> one that was just deleted. Since this parasit interface is not linked
> to any serial device, when a packet is send the kernel will panic.
> 
> Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
> ---
>  drivers/net/hamradio/mkiss.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/hamradio/mkiss.c b/drivers/net/hamradio/mkiss.c
> index 216bfd3..788f43e 100644
> --- a/drivers/net/hamradio/mkiss.c
> +++ b/drivers/net/hamradio/mkiss.c
> @@ -612,6 +612,11 @@ static int ax_open(struct net_device *dev)
>  
>  	ax->flags   &= (1 << AXF_INUSE);      /* Clear ESCAPE & ERROR flags */
>  
> +	/* Will force N_TTY discipline in tty_ldisc_hangup() to avoid
> +	 * tty_ldisc_reinit() call ax_open() again when the serial
> +	 * device is removed */
> +	ax->tty->driver->flags |= TTY_DRIVER_RESET_TERMIOS;

TTY_DRIVER_RESET_TERMIOS is a flag for use by the device driver so I don't
think this is ok.

  Ralf
