From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Timers in 2.6.x kernels
Date: Fri, 12 Mar 2004 20:09:21 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040312200921.C1707@jeroen.pe1rxq.ampr.org>
References: <200403121310.02980.oh1mrr@nic.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200403121310.02980.oh1mrr@nic.fi>; from oh1mrr@nic.fi on Fri, Mar 12, 2004 at 12:10:02 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 2004.03.12 12:10:02 +0100 Jarmo wrote:
> As can be seen fom 2.2 to 2.6 HZ is multiplied by 10.

> And 6pack,what we use here
> 
> /* default level 2 parameters */                                         
>       
> #define SIXP_TXDELAY                    (HZ/4) /* in 1 s */              
>      
> #define SIXP_PERSIST                    50      /* in 256ths */          
>       
> #define SIXP_SLOTTIME                   (HZ/10)        /* in 1 s */      
>      
> #define SIXP_INIT_RESYNC_TIMEOUT        (3*HZ/2) /* in 1 s */            
>       
> #define SIXP_RESYNC_TIMEOUT             5*HZ    /* in 1 s */  
> 
> 
> Now if we take sixp_txdelay  HZ/4 with this 2.6 kernel it gives
> value 2,5 seconds!

The kernel has an internal timer (called the jiffie counter) that counts in
a unit called a 'jiffie'.
HZ is the amount of jiffies that go in one second (and is thus the
frequency of the jiffie timer).
So HZ/4 should be 0.25 seconds.
If the 6pack driver does an 2.5 seconds wait it is either not due to the
HZ/4 counter or it has some pretty screwed up timing.
 
> So what we have done we have changed (HZ/4) to (HZ/40) and slottime
> value (HZ/10) into (HZ/100).
> 
> A little bit more success to keep system up longer,but it crash still...
> 
> And what we get into syslog
>
       
> Mar  5 16:46:58 oh1rbf kernel:  [apm_do_busy+22/48] apm_do_busy+0x16/0x30
>       
> Mar  5 16:46:58 oh1rbf kernel:  [<c01148b6>] apm_do_busy+0x16/0x30       

It might be coincedence, but could you try a kernel without apm?

> 
> 
> Question is.What we could do to get this mess working?
> 
> McGyver help!

I have a pocket knife (and I have ductape lying within a few meters of me,
does that count? :)


Jeroen

