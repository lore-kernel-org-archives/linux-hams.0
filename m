From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: [PATCH 2/3] Eleminate HZ from NET/ROM kernel interfaces
Date: Sun, 30 Apr 2006 21:34:32 +0200
Message-ID: <44551148.5010503@ccr.jussieu.fr>
References: <20060429141613.GA2811@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20060429141613.GA2811@linux-mips.org>
Sender: netdev-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-hams@vger.kernel.org

Ralf Baechle wrote :

> Convert all NET/ROM sysctl time values from jiffies to ms as units.
> 
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> 

With such extensive patches for netrom and rose modules that will go 
into a future 2.6.x kernel, I think it would be justified to update the 
following banners in af_rose.c and af_netrom.c respectively for they 
appear during boot :

static const char banner[] = KERN_INFO "F6FBB/G4KLX ROSE for Linux. 
Version 0.62 for AX25.037 Linux 2.4\n";

static char banner[] __initdata = KERN_INFO "G4KLX NET/ROM for Linux. 
Version 0.7 for AX25.037 Linux 2.4\n";

73 de Bernard, f6bvp

http://f6bvp.org
http://rose.fpac.free.fr/MINI-HOWTO/
http://rose.fpac.free.fr/MINI-HOWTO-FR/

