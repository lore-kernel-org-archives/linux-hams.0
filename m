From: Mike Fenske <mike_fenske@telus.net>
Subject: Re:  Making a call
Date: Sat, 10 Jul 2004 17:42:34 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3.0.6.32.20040710174234.007b8eb0@pop.telus.net>
References: <20040710025951.9278.qmail@web41213.mail.yahoo.com> <20040710143001.5249.qmail@web41212.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040710143001.5249.qmail@web41212.mail.yahoo.com>
References: <20040710025951.9278.qmail@web41213.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On my older KPC-9612, I have to use xkiss, not kiss mode. Using minicom, at
the command prompt change to xkiss by typing INTFACE XKISS <enter> and
RESET <enter>. I think this is correct. I'm going by memory because I set
it up many months ago and haven't touched it since. Hope this helps,

Mike Fenske
VE7MKF


At 07:30 10/07/04 -0700, Wijaya wrote:
>I receive some reply and says if I may forgot setting kiss mode on tnc.
>Before I enter to test my works, I check it before many times if it on
>newuser mode (cmd) or not with minicom.
>If it not show any cmd: prompt anymore after hardboot, I believe it was on
>Kiss mode as manual book says.
>
>below my axports config :
>/etc/ax25/axports
>axip	RE4SLO		1200	255	2	144.675 MHz (1200  bps)
>
>I don't know if speed on this axport config is serial port speed or tnc
>speed ?
>
>Thank's
>
>Wijaya
>--- Wijaya <wijaya_mail@yahoo.com> wrote:
>> Hi there,
>> I've just trying to setting up hamradio with Kantronics KPC-9612+ (TNC)
>> on
>> Linux. But it seems not work correctly. 
>> I was configure and load ax25/kiss driver kernel modules as required. 
>> I was configure axport, ax25d.conf, ax25ipd.conf.
>> TNC was configure on KISS mode.
>> Before I setting up TNC to KISS mode, I was trying to connect each other
>> use newuser/host mode from minicom. It working properly.
>> What I don't understand is, each time I trying to make a call : 
>> 
>> # call axip RE4SLO
>> 
>> Seems no one of TNC I've use to test no "Xmit /Rcv" and "Con / Sta" LED
>> is
>> lighting ON. Even, from the computer where I try to send it.
>> It seems no call instruction send to TNC. So what should I do ?
>> I was checking serial port many times if I've use wrong serial ports. But
>> nothing wrong about serial ports. 
>> Anyone here could give me an example from config to making a call to this
>> TNC.
>> Wishing any kind help from all of you.
>> Regards,
>> 
>> Wijaya
>> 
>> 
>> 
>> 		
>> __________________________________
>> Do you Yahoo!?
>> Yahoo! Mail is new and improved - Check it out!
>> http://promotions.yahoo.com/new_mail
>> _______________________________________________
>> Linux-ham mailing list
>> Linux-ham@trilug.org
>> http://www.trilug.org/mailman/listinfo/linux-ham
>> 
>
>
>
>		
>__________________________________
>Do you Yahoo!?
>Yahoo! Mail - Helps protect you from nasty viruses.
>http://promotions.yahoo.com/new_mail
>-
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

