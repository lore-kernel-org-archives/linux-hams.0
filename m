From: "Scott Weis" <kb2ear@kb2ear.net>
Subject: Re: What happened to mkiss module
Date: Mon, 25 Jul 2005 14:59:52 -0400
Message-ID: <007301c5914b$0a226c50$a4011fac@kb2ear1>
References: <000c01c59018$a50ec2b0$a4011fac@kb2ear1> <20050724084523.GA3130@linux-mips.org> <000801c590cd$3f3572d0$a4011fac@kb2ear1> <20050725133658.GB2814@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

OK now when I run kissattach I get:

kissattach: SIOCSIFHWADDR: Invalid argument

and in dmesg:
unregister_netdevice: device ax%d/c1b95c00 never was registered

Would all of this go away in 2.6.13.rc4??  Where can I get it.. I can only 
find rc3

Thanks, Scott KB2EAR
----- Original Message ----- 
From: "Ralf Baechle DL5RB" <ralf@linux-mips.org>
To: "Scott Weis" <kb2ear@kb2ear.net>
Cc: <linux-hams@vger.kernel.org>
Sent: Monday, July 25, 2005 9:36 AM
Subject: Re: What happened to mkiss module


> On Sun, Jul 24, 2005 at 11:59:24PM -0400, Scott Weis wrote:
>
>> OK I applied the patch to the linux-2.6.12. Had to do some of the patch 
>> by
>> hand.  It compiled ok.. Now I can't load the module because of  mkiss:
>> Unknown symbol tty_unregister_ldisc.  What version of the kernel source 
>> am
>> I supposed to be patching??
>
> 2.6.13-rc4 or newer.
>
> The reject you must have gotten was exactly due to the introduction of
> tty_unregister_ldisc in rc4.  You can glue that with something like
>
> #define tty_unregister_ldisc(disc) tty_register_ldisc(disc, NULL)
>
>  Ralf
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> 


