From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: [PATCH] ax25 Locking fix
Date: Sat, 14 Feb 2004 00:18:22 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <402D694E.5080802@ccr.jussieu.fr>
References: <20040213234806.J220@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040213234806.J220@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: davem@redhat.com, linux-hams@vger.kernel.org, ralf@linux-mips.org

Hi,

Is there any chance that you could have a look at rose.o module code in 
order to fix a kernel panic problem.
If rose module is just installed it can be removed and reinstalled 
without problem.
But as soon as I do "ifconfig rose0 2080175502" I have a kernel panic.
Also if I perform a rsattach and try to remove the module then I have a 
kernel oops.

Once I had the chance to catch this message from syslog@f6bvp
   (f6bvp is the actual name of my Linux machine):

f6bvp kernel : unregister_net_device : wainting for rose0 to become 
free. Usage count  =1
repeats x times ...

and then I observed a catastrophic PC reboot.

73 de Bernard, f6bvp

----------------------------

Jeroen Vreeken wrote:
> Hi,
> 
> This is a oneliner for 2.6 changing an unlock into a lock.
> This prevents an oops on removal of the ax25 module.
> 
> Jeroen


de Bernard, f6bvp

