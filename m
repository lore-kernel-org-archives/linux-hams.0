From: folkert <folkert@vanheusden.com>
Subject: Re: problems with howto at
	http://tldp.org/HOWTO/AX25-HOWTO/x495.html
Date: Wed, 23 Jun 2010 13:23:37 +0200
Message-ID: <20100623112336.GI15838@belle.intranet.vanheusden.com>
References: <20100623111550.GH15838@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100623111550.GH15838@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Ok I should've waited before posting: the device is now called bcsh0-3.

On Wed, Jun 23, 2010 at 01:15:51PM +0200, folkert wrote:
> Hi,
> 
> I'm trying to implement a baycom-construction with my 27mc setup.
> Now I follow the howto at http://tldp.org/HOWTO/AX25-HOWTO/x495.html but
> I fail already at one of the first steps :-)
> 
> I tried:
> 	/bin/setserial /dev/ttyS0 uart none
> 	/sbin/modprobe hdlcdrv
> 	/sbin/modprobe baycom_ser_hdx mode="ser12*" iobase=0x3f8 irq=4
> and I tried (after a reboot):
> 	modprobe baycom_ser_hdx
> 	sethdlc -p -i bc0 mode "ser12*" io 0x3f8 irq 4
> 
> But the problem is, that no /dev/bc* device appears.
> I'm running a stock debian 2.6.32 kernel.
> 
> Anyone got an idea what may be going wrong?
> 
> 
> Folkert van Heusden
> 
> -- 
> ----------------------------------------------------------------------
> Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


Folkert van Heusden

-- 
MultiTail is a versatile tool for watching logfiles and output of
commands. Filtering, coloring, merging, diff-view, etc.
http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
