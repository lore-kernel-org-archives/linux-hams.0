From: Jarek Poplawski <jarkao2@gmail.com>
Subject: Re: [AX25] kernel panic
Date: Fri, 11 Sep 2009 21:21:40 +0200
Message-ID: <4AAAA344.4030200@gmail.com>
References: <4AA82BF0.7040203@upmc.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=xJ4DgNQELmZazc4y8ChMiyLCBHvJu/xjhcizfUfaq3I=;
        b=eM4WDNF4F6xqAC67i+Vd/fMgl18YjsFkmTfEEzFlwDAxzIUkrS25Fg9TFbfs55cnSt
         bwwRXb79CCbYi7Auiu2p7LXqgQlvtOUvl2334aMK+5smV67npG5xcp9zAeEb93Z4FcNe
         WxlZh2gH5EKFFV9tgws7kRDD0mkU7BYDY9YfY=
In-Reply-To: <4AA82BF0.7040203@upmc.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernard Pidoux <bernard.pidoux@upmc.fr>
Cc: Ralf Baechle DL5RB <ralf@linux-mips.org>, Linux Netdev List <netdev@vger.kernel.org>, linux-hams <linux-hams@vger.kernel.org>

Bernard Pidoux wrote, On 09/10/2009 12:28 AM:

> Hi Ralf,
> 
> Here is a set of not so frequent kernel panics captured via netconsole
> that seem related to AX25 timer. 
> 
> Regards,
> 
> Bernard Pidoux
> 

Hi Bernard,

Could/did you try to turn on this debugging option below, btw?

Regards,
Jarek P.

   CONFIG_DEBUG_OBJECTS_TIMERS:
  ?                                                                                                        ?  
  ? If you say Y here, additional code will be inserted into the                                           ?  
  ? timer routines to track the life time of timer objects and                                             ?  
  ? validate the timer operations.                                                                         ?  
  ?                                                                                                        ?  
  ? Symbol: DEBUG_OBJECTS_TIMERS [=y]                                                                      ?  
  ? Prompt: Debug timer objects                                                                            ?  
  ?   Defined at lib/Kconfig.debug:247                                                                     ?  
  ?   Depends on: DEBUG_OBJECTS                                                                            ?  
  ?   Location:                                                                                            ?  
  ?     -> Kernel hacking                                                                                  ?  
  ?       -> Kernel debugging (DEBUG_KERNEL [=y])                                                          ?  
  ?         -> Debug object operations (DEBUG_OBJECTS [=y])                                                ?  
  ?                                                                      

