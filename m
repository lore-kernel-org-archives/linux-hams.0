From: Jarmo <oh1mrr@nic.fi>
Subject: Timers in 2.6.x kernels
Date: Fri, 12 Mar 2004 13:10:02 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200403121310.02980.oh1mrr@nic.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi

We have still struggling with ax25 and especially with 6pack.
We get 6pack crashing randomly...

Have found that timerparameters have loud a much differences
between kernels 2.2-->2.4-->2.6.Now looked up,that there is
big change happened in kernels param.h file.

This is from 2.2.26 kernel..

#ifndef _ASMi386_PARAM_H                                                        
#define _ASMi386_PARAM_H                                                                                                                                        
#ifndef HZ                                                                      
#define HZ 100                                                                  
#endif            

This is from 2.6.4

#ifndef _ASMi386_PARAM_H                                                        
#define _ASMi386_PARAM_H                                                                                                                                        
#ifdef __KERNEL__                                                               
# define HZ             1000            /* Internal kernel timer frequency */   
# define USER_HZ        100             /* .. some user interfaces are in 
"ticks# define CLOCKS_PER_SEC (USER_HZ)       /* like times() */                      
#endif                                                                                                                                                          
#ifndef HZ                                                                      
#define HZ 100                                                                  
#endif  

As can be seen fom 2.2 to 2.6 HZ is multiplied by 10.

OK,now ax25.h instead is same in all these kernels   

#define AX25_DEF_T1             (10 * HZ)               /* T1=10s */            
#define AX25_DEF_T2             (3 * HZ)                /* T2=3s  */            
#define AX25_DEF_T3             (300 * HZ)              /* T3=300s */           
#define AX25_DEF_N2             10                      /* N2=10 */             
#define AX25_DEF_IDLE           (0 * 60 * HZ)           /* Idle=None */         
#define AX25_DEF_PACLEN         256                     /* Paclen=256 */        
#define AX25_DEF_PROTOCOL       AX25_PROTO_STD_SIMPLEX  /* Standard AX.25 */    
#define AX25_DEF_DS_TIMEOUT     (3 * 60 * HZ)           /* DAMA timeout 3 
minute

And 6pack,what we use here

/* default level 2 parameters */                                                
#define SIXP_TXDELAY                    (HZ/4) /* in 1 s */                    
#define SIXP_PERSIST                    50      /* in 256ths */                 
#define SIXP_SLOTTIME                   (HZ/10)        /* in 1 s */            
#define SIXP_INIT_RESYNC_TIMEOUT        (3*HZ/2) /* in 1 s */                   
#define SIXP_RESYNC_TIMEOUT             5*HZ    /* in 1 s */  


Now if we take sixp_txdelay  HZ/4 with this 2.6 kernel it gives
value 2,5 seconds!

So what we have done we have changed (HZ/4) to (HZ/40) and slottime
value (HZ/10) into (HZ/100).

A little bit more success to keep system up longer,but it crash still...

And what we get into syslog

 Mar  5 16:46:58 oh1rbf kernel: 6pack: bad checksum f7                           
Mar  5 16:46:58 oh1rbf last message repeated 4 times                            
Mar  5 16:46:58 oh1rbf kernel: bad: scheduling while atomic!                    
Mar  5 16:46:58 oh1rbf kernel: Call Trace:                                      
Mar  5 16:46:58 oh1rbf kernel:  [schedule+1339/1408] schedule+0x53b/0x580       
Mar  5 16:46:58 oh1rbf kernel:  [<c011869b>] schedule+0x53b/0x580               
Mar  5 16:46:58 oh1rbf kernel:  [_stext+0/32] rest_init+0x0/0x20                
Mar  5 16:46:58 oh1rbf kernel:  [<c0105000>] rest_init+0x0/0x20                 
Mar  5 16:46:58 oh1rbf kernel:  [apm_do_busy+22/48] apm_do_busy+0x16/0x30       
Mar  5 16:46:58 oh1rbf kernel:  [<c01148b6>] apm_do_busy+0x16/0x30              
Mar  5 16:46:58 oh1rbf kernel:  [_stext+0/32] rest_init+0x0/0x20                
Mar  5 16:46:58 oh1rbf kernel:  [<c0105000>] rest_init+0x0/0x20                 
Mar  5 16:46:58 oh1rbf kernel:  [cpu_idle+57/64] cpu_idle+0x39/0x40             
Mar  5 16:46:58 oh1rbf kernel:  [<c0108be9>] cpu_idle+0x39/0x40                 
Mar  5 16:46:58 oh1rbf kernel:  [start_kernel+345/400] 
start_kernel+0x159/0x190 Mar  5 16:46:58 oh1rbf kernel:  [<c02e06c9>] 
start_kernel+0x159/0x190           Mar  5 16:46:58 oh1rbf kernel:                                                  
Mar  5 16:46:58 oh1rbf kernel: 6pack: resyncing TNC                             
Mar  5 16:46:58 oh1rbf last message repeated 2 times                            
Mar  5 16:46:58 oh1rbf kernel: 6pack: TNC found.                                
Mar  5 16:46:58 oh1rbf kernel: 6pack: bad checksum f7                           
Mar  5 16:46:58 oh1rbf kernel: 6pack: bad checksum f7  


Question is.What we could do to get this mess working?

McGyver help!

Jarmo                                                                                                                                                                                                                                             
