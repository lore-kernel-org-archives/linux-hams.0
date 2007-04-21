From: John Ackermann N8UR <jra@febo.com>
Subject: Re: bcp0 interface start
Date: Sat, 21 Apr 2007 17:14:34 -0400
Message-ID: <462A7EBA.9010002@febo.com>
References: <200704211527.55806.jftaylor@citlink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200704211527.55806.jftaylor@citlink.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John F. Taylor" <jftaylor@citlink.net>
Cc: linux-hams@vger.kernel.org

John, it's been a while since I've configured the BP-9600, so I may be
wrong in my recollection, but I believe that the AX.25 ports aren't
directly linked to the network devices that ifconfig sees.  You use the
axports and other ax.25 config files and ignore the network device
except for TCP/IP routing.

I have some stuff -- now very ancient -- at
http://www.febo.com/packet/linux-ax25/ax25-config.html that explains how
all the pieces fit together.

73,
John
----

John F. Taylor said the following on 04/21/2007 03:27 PM:
> Hello All,
>   I am trying to use a Baycom BP-9600 modem on a Slackware 11 stock 
> installation w/ 2.4.33.3 kernel.
>   I cannot discover how to to associate the module with the axports file.
> When I type ifconfig I only see the ax0 interfaces.  ifconfig -a shows the 
> bcp0-3 interfaces.  Shouldn't these bcp(N) be ax(N) interfaces also?
> 
> jt
> n2cwy
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

