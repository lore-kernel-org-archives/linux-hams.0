From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: [PATCH] ax25 Locking fix
Date: Sat, 28 Feb 2004 18:26:50 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040228172650.GA4106@linux-mips.org>
References: <20040213234806.J220@jeroen.pe1rxq.ampr.org> <402D694E.5080802@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <402D694E.5080802@ccr.jussieu.fr>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: Jeroen Vreeken <pe1rxq@amsat.org>, davem@redhat.com, linux-hams@vger.kernel.org

On Sat, Feb 14, 2004 at 12:18:22AM +0000, Bernard Pidoux wrote:

> Is there any chance that you could have a look at rose.o module code in 
> order to fix a kernel panic problem.
> If rose module is just installed it can be removed and reinstalled 
> without problem.
> But as soon as I do "ifconfig rose0 2080175502" I have a kernel panic.
> Also if I perform a rsattach and try to remove the module then I have a 
> kernel oops.

I assume you meant "ifconfig rose0 hw rose 2080175502"?  Without the
"hw rose" it's just an obscure way to set the ip address to 12.104.129.142.

> Once I had the chance to catch this message from syslog@f6bvp
>   (f6bvp is the actual name of my Linux machine):
> 
> f6bvp kernel : unregister_net_device : wainting for rose0 to become 
> free. Usage count  =1
> repeats x times ...
> 
> and then I observed a catastrophic PC reboot.

Sounds like a problem with reference counting, can't be hard to fix.

  Ralf
