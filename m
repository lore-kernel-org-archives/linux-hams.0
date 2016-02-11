From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: [PATCH 1/1] Add poll method to mkiss let notify hangup to the
 user process.
Date: Thu, 11 Feb 2016 20:14:23 +0100
Message-ID: <20160211191423.GC24276@x-berg.in-berlin.de>
References: <560EBE07.70801@eclis.ch>
 <1443822373-18395-1-git-send-email-jc@eclis.ch>
 <560F217B.6020106@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560F217B.6020106@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: Jean-Christian de Rivaz <jc@eclis.ch>, Thomas Osterried <thomas@osterried.de>, Ralf Baechle DL5RB <ralf@linux-mips.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Peter Hurley <peter@hurleysoftware.com>, linux-hams@vger.kernel.org

Hello,

unfortunately, I cannot get my mail to Jean-Christian's ISP
(Deferred: Connection timed out with mail.eclis.ch.).

That's why I try it now on this list.

In short:
- Jean-Christian's patch depends on both:
   a patched kissattach program AND the mentioned kernel patch below.
- Unfotunately, it does not work: kissattach does not terminate
  (in order to prevent the panic) and the kernel still panics.
- If we get it work, 6pack.c sould also be patched the same way as mkiss.c.
- 6pack.c does not panic. The reason is the pre-initializiation of some
  variables (6pack.c usefule values, mkiss.c zero).
  I tried to use the correct values from 6pack.c in mkiss.c and this fixes
  the panic.
- I'd like Jean's patch to get running, because it's good if kissattach
  gets notified that the usb device is not present anymore. Only if it's
  terminating, /dev/ttyUSB0 will be freed (otherwise, someone who plugs
  off-and-in will have an unsable /dev/ttyUSB0 and a new /dev/ttyUSB1).


Here's my mail to Jean-Christian whith my request to verify - now to
everyone who likes to test.


Hello,

has anybody tried it?

I've tried it on debian kernel 3.16.0-4-amd64 with a patched+recompiled mkiss.ko and the modified kissattach program.
It does not work.
kissattach does not get notified in his poll(). Thus still keeps alive after the usb plug-off event. Because it's not terminating, the mkiss race condition is not prevented.

Interesting: if I plug usb of and then strace to the pid of kissattach, it terminates.



Btw, when pre-initializing
       dev->hard_header_len    = AX25_MAX_HEADER_LEN;
       dev->addr_len           = AX25_ADDR_LEN;
in ax_setup() (like sp_setup() in 6pack.c does), the kernel does not panic anymore.


Anyway, it would be nice if kissattach could get notice if something with the ax25 interface happened and would to the appropriate action (termination) - something Jean-Christian intended with his patch.
Also, I like the idea of the blocking poll() instead of the previous while (1) { sleep(... )} construct. Furthermore, it's still backwards-compatible to an unpatched mkiss.ko and 6pack.ko (tested).

If we can manage his patch to work, keep in mind that we have also to patch 6pack.c, because the kissattach program is the same for spattach.



Test scenario:
plug-in the usb device
kissattach /dev/ttyUSB0 ax0
ifconfig ax0 44.128.128.1
plug-off the usb device
ps axwww| grep kissattach  # -> still running
ifconfig ax0 44.128.128.1 up
ping 44.128.128.2
PANIC


vy 73,
	- Thomas  dl9sau



On Fri, Oct 02, 2015 at 05:29:47PM -0700, David Ranch wrote:
> 
> Hello Jean-Christian, Everyone,
> 
> Thanks for working on this as I'm pretty sure I've bit hit by this panic as
> well though I wasn't able to reproduce it more readily. Anyway, if this is
> the proper fix moving forward, will the kernel not panic even if kissattach
> is not updated?  Can you also include the needed patch for the kissattach
> program to complete this solution?
> 
> --David
> 
> 
> On 10/02/2015 02:46 PM, Jean-Christian de Rivaz wrote:
> >Without this the application that use the mkiss line discipline have
> >no way to terminate in case the corresponding serial device is
> >removed, for example when a USB TNC is unplugged. The application must
> >wait on poll().
> >
> >The kissattach application must be patched to take advantage of this
> >feature.
> >
> >Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
> >---
> >  drivers/net/hamradio/mkiss.c |   15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> >diff --git a/drivers/net/hamradio/mkiss.c b/drivers/net/hamradio/mkiss.c
> >index fba41e9..50cd36c 100644
> >--- a/drivers/net/hamradio/mkiss.c
> >+++ b/drivers/net/hamradio/mkiss.c
> >@@ -893,6 +893,20 @@ static long mkiss_compat_ioctl(struct tty_struct *tty, struct file *file,
> >  #endif
> >  /*
> >+ * Waiting until hangup is the only allowed operation. This is used
> >+ * to notify the application in case the serial deivce is removed
> >+ * (ex. USB). The tty_ldisc_hangup() will wake up the process.
> >+ */
> >+static unsigned int mkiss_poll(struct tty_struct *tty, struct file *file,
> >+							poll_table *wait)
> >+{
> >+	poll_wait(file, &tty->read_wait, wait);
> >+	poll_wait(file, &tty->write_wait, wait);
> >+
> >+	return 0;
> >+}
> >+
> >+/*
> >   * Handle the 'receiver data ready' interrupt.
> >   * This function is called by the 'tty_io' module in the kernel when
> >   * a block of data has been received, which can now be decapsulated
> >@@ -969,6 +983,7 @@ static struct tty_ldisc_ops ax_ldisc = {
> >  #ifdef CONFIG_COMPAT
> >  	.compat_ioctl	= mkiss_compat_ioctl,
> >  #endif
> >+	.poll           = mkiss_poll,
> >  	.receive_buf	= mkiss_receive_buf,
> >  	.write_wakeup	= mkiss_write_wakeup
> >  };
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
