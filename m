From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: What happened to mkiss module
Date: Mon, 25 Jul 2005 09:36:58 -0400
Message-ID: <20050725133658.GB2814@linux-mips.org>
References: <000c01c59018$a50ec2b0$a4011fac@kb2ear1> <20050724084523.GA3130@linux-mips.org> <000801c590cd$3f3572d0$a4011fac@kb2ear1>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000801c590cd$3f3572d0$a4011fac@kb2ear1>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Weis <kb2ear@kb2ear.net>
Cc: linux-hams@vger.kernel.org

On Sun, Jul 24, 2005 at 11:59:24PM -0400, Scott Weis wrote:

> OK I applied the patch to the linux-2.6.12. Had to do some of the patch by 
> hand.  It compiled ok.. Now I can't load the module because of  mkiss: 
> Unknown symbol tty_unregister_ldisc.  What version of the kernel source am 
> I supposed to be patching??

2.6.13-rc4 or newer.

The reject you must have gotten was exactly due to the introduction of
tty_unregister_ldisc in rc4.  You can glue that with something like

#define tty_unregister_ldisc(disc) tty_register_ldisc(disc, NULL)

  Ralf
