From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: AX-25 software that works on Fedora Core 4?
Date: Mon, 22 Aug 2005 13:03:32 +0100
Message-ID: <20050822120332.GD3780@linux-mips.org>
References: <20050820172614.GB2828@linux-mips.org> <Pine.LNX.4.44.0508211157320.12419-100000@cwoux2.cerise.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0508211157320.12419-100000@cwoux2.cerise.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacques Chion <Jacques.Chion@wanadoo.fr>
Cc: Scott Weis <kb2ear@kb2ear.net>, linux-hams@vger.kernel.org

On Sun, Aug 21, 2005 at 12:05:57PM +0200, Jacques Chion wrote:

> I applied the patch to the mkiss.c of the kernel-2.6.12.5.
> Now i can use again the ax25 and kiss mode without problems.
> Only two small problems :
> 
> -the patch you have sent by mail refuse to apply after line 885, but i
> finished by hand, and no problem to compile.

That is expected for this kernel version.  There has been another change
to mkiss.c for 2.6.13-rc1:

--- linux/drivers/net/hamradio/mkiss.c	2005/05/19 12:08:26	1.29
+++ linux/drivers/net/hamradio/mkiss.c	2005/07/11 20:47:35	1.30
@@ -934,7 +934,7 @@ static void __exit mkiss_exit_driver(voi
 	kfree(ax25_ctrls);
 	ax25_ctrls = NULL;
 
-	if ((i = tty_register_ldisc(N_AX25, NULL)))
+	if ((i = tty_unregister_ldisc(N_AX25)))
 		printk(KERN_ERR "mkiss: can't unregister line discipline (err = %d)\n", i);
 }

My patch will only apply cleanly apply to drivers that already contain
this change.

I assume this change was the cause of your problem also?

> -soundmodem, that i use, is complaining about SIOCSIFHADDR, but it seems
> to work properly.

Well, that's a different construction site.  But I may try to look into
it if you tell me which version of soundmodem you're running.

> So, thank you and again, great job !

Thank you, such feedback - no matter if negative or positive is really
important.

  Ralf
