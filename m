From: cyberdoc@matrix.subsolar.com
Subject: Re: Success! TWO questions remain
Date: Thu, 12 Dec 2002 08:09:25 -0600 (CST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212120806220.11889-100000@matrix>
References: <Pine.LNX.4.44.0212120813300.5835-100000@jeeves.mvw.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212120813300.5835-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mvw@mvw.net
Cc: linux-hams@vger.kernel.org


Hello,

You can firewall off port 23 on your internet interface... telnet won't be 
disabled, but the packets will never reach the daemon (service) for 
processing.  Turn off port 23 on all LAN based connections, and keep it 
open on the ax interfaces.

This means you need to run either ipchains or iptables.  I can help you 
with either if you wish.

Christian


On Thu, 12 Dec 2002 mvw@mvw.net wrote:

> Hello all,
> 
> Wonder if anyone saw my previous message?
> 
> In any case, another question. I want to be able to telnet into one
> machine from another using radio. Encryption is forbidden for amateur use
> so this means clear passwords. Not good. (Even though I will not use root, 
> of course).
> 
> BUT, compression _is_ allowed. How can I get the tcp/ip content to be 
> compressed, so it is at least not easily readable?
> 
> Thanks,
> Michael
> 
> PS plus, how can I get telnet to accept connections only on its radio 
> port? This is a generalLinux question but if anyone happens to know the 
> answer?
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

