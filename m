From: David Quental <ct1drb@iol.pt>
Subject: Re: Gmfsk and kernel 2.6.2 - PROBLEM SOLVED.
Date: Thu, 05 Feb 2004 08:31:42 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4021FF6E.30608@iol.pt>
References: <402163F0.1060406@iol.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <402163F0.1060406@iol.pt>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>

Hello to all.

Only to inform that i have the problem solved, thanks to help of Tomi.
I only added sound lines from previous /etc/modules. conf to new 
/etc/modprobe.conf, then did depmod -a and all ran fine and without 
problems.

Thanks for all and till next time.

CT1DRB
David Quental


> Hello to all.
>
> I am testing kernel 2.6.2 and gmfsk, but have problems with it, gmfsk 
> refuses to work because it does not find device /dev/dsp1 (i have 2 
> sound-cards in my computer), but in fact /dev/dsp1 exists and 
> permissions are right. Is this problem a bad configuration of my side 
> or a bug in new kernel 2.6.2??? With kernel 2.6.1 i think i had not 
> this problem, it only happened with recent versions of 2.6.2 and a bit 
> before.
>
> Any help will be welcome here.
>
> Best 73 and thanks for reading my email
>
> CT1DRB
> David Quental
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

