From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: aliasing 4 net-pf-10??
Date: Sat, 24 Aug 2002 17:35:33 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020824173533.A27824@pull.privacy.nb.ca>
References: <20020823230519.5331.qmail@linux.ik5bcu.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020823230519.5331.qmail@linux.ik5bcu.ampr.org>; from ik5bcu@tin.it on Sat, Aug 24, 2002 at 01:05:19AM +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sat, Aug 24, 2002 at 01:05:19AM +0200, Marco Calistri wrote:
> Hello,could someone point me on the proper aliasing for net-pf-10?
> What is it?
> 
> cat /var/log/messages
> 
> Aug 23 23:45:46 sys3 modprobe: modprobe: Can't locate module net-pf-10

net-pf-10 is IPv6 (IP version 6) which I doubt you use, so you can add
   alias net-pf-10 off 
to /etc/modules.conf.

