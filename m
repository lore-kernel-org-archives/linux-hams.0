From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [PATCH 1/1] Add poll method to mkiss let notify hangup to the
 user process.
Date: Fri, 2 Oct 2015 17:29:47 -0700
Message-ID: <560F217B.6020106@trinnet.net>
References: <560EBE07.70801@eclis.ch>
 <1443822373-18395-1-git-send-email-jc@eclis.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1443822373-18395-1-git-send-email-jc@eclis.ch>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jean-Christian de Rivaz <jc@eclis.ch>, Thomas Osterried <thomas@osterried.de>, Ralf Baechle DL5RB <ralf@linux-mips.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Peter Hurley <peter@hurleysoftware.com>
Cc: linux-hams@trinnet.net, linux-hams@vger.kernel.org


Hello Jean-Christian, Everyone,

Thanks for working on this as I'm pretty sure I've bit hit by this panic 
as well though I wasn't able to reproduce it more readily. Anyway, if 
this is the proper fix moving forward, will the kernel not panic even if 
kissattach is not updated?  Can you also include the needed patch for 
the kissattach program to complete this solution?

--David


On 10/02/2015 02:46 PM, Jean-Christian de Rivaz wrote:
> Without this the application that use the mkiss line discipline have
> no way to terminate in case the corresponding serial device is
> removed, for example when a USB TNC is unplugged. The application must
> wait on poll().
>
> The kissattach application must be patched to take advantage of this
> feature.
>
> Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
> ---
>   drivers/net/hamradio/mkiss.c |   15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/drivers/net/hamradio/mkiss.c b/drivers/net/hamradio/mkiss.c
> index fba41e9..50cd36c 100644
> --- a/drivers/net/hamradio/mkiss.c
> +++ b/drivers/net/hamradio/mkiss.c
> @@ -893,6 +893,20 @@ static long mkiss_compat_ioctl(struct tty_struct *tty, struct file *file,
>   #endif
>   
>   /*
> + * Waiting until hangup is the only allowed operation. This is used
> + * to notify the application in case the serial deivce is removed
> + * (ex. USB). The tty_ldisc_hangup() will wake up the process.
> + */
> +static unsigned int mkiss_poll(struct tty_struct *tty, struct file *file,
> +							poll_table *wait)
> +{
> +	poll_wait(file, &tty->read_wait, wait);
> +	poll_wait(file, &tty->write_wait, wait);
> +
> +	return 0;
> +}
> +
> +/*
>    * Handle the 'receiver data ready' interrupt.
>    * This function is called by the 'tty_io' module in the kernel when
>    * a block of data has been received, which can now be decapsulated
> @@ -969,6 +983,7 @@ static struct tty_ldisc_ops ax_ldisc = {
>   #ifdef CONFIG_COMPAT
>   	.compat_ioctl	= mkiss_compat_ioctl,
>   #endif
> +	.poll           = mkiss_poll,
>   	.receive_buf	= mkiss_receive_buf,
>   	.write_wakeup	= mkiss_write_wakeup
>   };

