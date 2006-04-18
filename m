From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: Re: error when trying to run kissattach on 2.6.13-15.8 Suse Kernel
Date: Tue, 18 Apr 2006 07:51:31 -0400
Message-ID: <000c01c662de$6f80c690$650ea8c0@LoJackOne.LoJack.com>
References: <200604172021.01888.jjgpg@cet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Jeremiah <jjgpg@cet.com>, linux-hams@vger.kernel.org

It is broken and I don't know of a reliable patch other than getting the 
latest kernel from kernel.org.  You have 3 choices.

1. Back off to SuSE 9.3.
2. Try SuSE 10.1 RC1 (See www.opensuse.org)
3. Update the kernel to 2.6.16 from kernel.org sources.

Mike, W1NR

----- Original Message ----- 
From: "Jeremiah" <jjgpg@cet.com>
To: <linux-hams@vger.kernel.org>
Sent: Monday, April 17, 2006 11:21 PM
Subject: error when trying to run kissattach on 2.6.13-15.8 Suse Kernel


> Hello all,
>
> I get an error when trying to start up kissattach on my Suse 10 box.
> I'm running the Suse 2.6.13-15.8 kernel, no changes made to it.
>
> When I run
> "kissattach /dev/ttyS0 vhf 10.0.0.1"
> I get back
> "kissattach: Error setting line discipline: TIOCSETD: No such device
> Are you sure you have enabled MKISS support in the kernel
> or, if you made it a module, that the module is loaded?"
>
> I get no other error other than suse complaning that I didn't configure 
> and
> AX0 port.
> Any ideas, Do I need to patch?
>
> I do have the AX.25 stuff downloaded from suse linux ham YAST source.
>
> Any input would be of help.
>
> Thanks
>
> Jeremiah
> KD7DMP
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

