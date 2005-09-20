From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: 2.6.14-rc1 PPC ax25 broken
Date: Tue, 20 Sep 2005 20:52:50 +0100
Message-ID: <20050920195250.GB22664@linux-mips.org>
References: <20050918204439.25408.qmail@kunk.qbjnet.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050918204439.25408.qmail@kunk.qbjnet.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Brose <linuxhams@n0qbj-11.ampr.org>
Cc: linux-hams@vger.kernel.org

On Sun, Sep 18, 2005 at 08:44:39PM -0000, Bob Brose wrote:

> I've 2 machines, one Pentium the other Mac PPC with as identical as 
> possible 2.6.14-rc1 kernels and exactly the same ax25 configuration.
> The x86 ax25 works, the ppc doesn't. I'm using a built in mac serial
> port, mkiss and kissattach. 
> 
> In trying to narrow the area of the problem down I've found that on
> the pcc the listen command sees packets coming and going and the
> counters on the interface (netstat -in) for both xmit and rcv increment
> as expected. The call (for ax25 connects) command works fine on the ppc.
> 
> The problem is with arp and ip on incoming packets. The arp doesn't
> add the remote ip to the arp table on the ppc. If I set it manually,
> then I see both sent and reply pings in the listen command however the
> ping still doesn't work, it looks like the packets are getting dropped
> somewhere between the ax25 and ip layers.
> 
> As far as I can tell ax25 ip has never worked on 2.6 kernels. I went to

You're the first to say that.

> 2.6.14-rc1 to get Ralf's latest patches in place but it still doesn't
> work. It does work fine on PPC in 2.4. I've had a mac running the main
> amprnet gateway in Minnesota, US for for a couple of years and it's on 
> 2.4.31 and working nicely.
> I'll keep hacking at trying to find the problem however it would help
> if someone in the know felt like pointing me to the module most likely
> to be causing the trouble...

A little odd, in case of PPC I'd at first guess the problem might be
endianess but there really isn't much of endianess dependant code in the
whole AX.25.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
