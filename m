From: "Marco Calistri" <ik5bcu@tin.it>
Subject: Re: aliasing 4 net-pf-10??
Date: Sun, 25 Aug 2002 00:12:22 +0200 (CEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020824221222.3571.qmail@linux.ik5bcu.ampr.org>
References: <20020824173533.A27824@pull.privacy.nb.ca>
Reply-To: ik5bcu@tin.it
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020824173533.A27824@pull.privacy.nb.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: M Taylor <mctylr@privacy.nb.ca>
Cc: linux-hams@vger.kernel.org


On 24-Aug-2002 M Taylor wrote:
> On Sat, Aug 24, 2002 at 01:05:19AM +0200, Marco Calistri wrote:
>> Hello,could someone point me on the proper aliasing for net-pf-10?
>> What is it?
>> 
>> cat /var/log/messages
>> 
>> Aug 23 23:45:46 sys3 modprobe: modprobe: Can't locate module net-pf-10
> 
> net-pf-10 is IPv6 (IP version 6) which I doubt you use, so you can add
>    alias net-pf-10 off 
> to /etc/modules.conf.

Thanks all who answered about this topic.

Vy 73's 

Marco/ik5bcu
