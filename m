From: bernard pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: Problem...
Date: Thu, 27 Mar 2003 13:01:37 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E82E821.2080304@ccr.jussieu.fr>
References: <GMEHKCCPLOCMPOLBMKICCEJNDOAA.hremijn@zeelandnet.nl> <3E8086E6.3000709@ccr.jussieu.fr> <200303251925.56224.oh1mrr@nic.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200303251925.56224.oh1mrr@nic.fi>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jarmo <oh1mrr@nic.fi>
Cc: linux-hams@vger.kernel.org

Jarmo wrote:

>On Tuesday 25 March 2003 18:42, bernard pidoux wrote:
>
>  
>
>>For example,  install Mandrake Linux distro 7.2, then update with 7.2
>>update (february 2003 delivery or so) that can be found on any Linux
>>distro mirror.
>>Then install (optionally) the last 2.2 kernel if you want.
>>
>>Bernard Pidoux, F6BVP
>>    
>>
>
>Hi
>
>I have all ax25 stuff compiled as modules and working like charm
>in mandrake 9.0 with kernel 2.4.20.
>
>Have one 9k6 port using 6pack...So with 2.4.x series kernel ax25
>IS working fine...
>Have tested 2.5.x series and there ax25 does not work....
>
>Jarmo
>  
>

I am glad that your AX25 applications are working fine with Linux kernel 
2.4.x
I was only reporting that this is not the case when serial link are 
handled by mkiss.
I assume that it is a question of heavy interrupts load for I have 
traced the problem and found that kernel panics occur very often around 
the same address in ax25 input routines.
This is probably related to the lot of cli() instructions and the new 
way interrupts are managed in 2.4 kernels.
All these cli() sti() have been removed in 2.5 kernel. Thats why I hope 
mkiss will work again on 2.6.

Best 73 de Bernard, F6BVP


