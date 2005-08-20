From: "Geoff L. Kennedy" <starwarrior@telus.net>
Subject: Re: AX-25 software that works on Fedora Core 4?
Date: Fri, 19 Aug 2005 18:22:30 -0700 (PDT)
Message-ID: <Pine.LNX.4.44.0508191816550.18492-100000@stargate.gelaken.ca>
References: <001701c5a4ef$996db510$a4011fac@kb2ear1>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001701c5a4ef$996db510$a4011fac@kb2ear1>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Fri, 19 Aug 2005, Scott Weis wrote:

> I have been working for weeks to try and get AX-25 working with the mkiss 
> module.  Best I can figure is that there is no working AX25 for SMP kernels 
> and core 4.  The ax25-utils package has not kept up with the updates made in 
> the kernel. This is all I can manage to get when I try to start an 
> interface..
 
> + /usr/local/sbin/mkiss -s 9600 /dev/ttyS0 /dev/ptya1 /dev/ptya2
> + /usr/local/sbin/kissattach /dev/ttya1 ax0 172.16.198.1
> kissattach: SIOCSIFHWADDR: Invalid argument
> unregister_netdevice: device ax%d/ddc80400 never was registered
> + ifconfig ax0 netmask 255.255.255.0 broadcast 172.16.198.255
> SIOCSIFNETMASK: No such device
	:
	:
> ax1: unknown interface: No such device

   Fedora typically uses "udev" to set up device nodes at startup,
perhaps this is the problem ?

   Just a thought, I'm no expert on udev.......  ;-(


-- 

Geoff L. Kennedy        North Delta, British Columbia, Canada
starwarrior@telus.net   Lat: +49.176  Long: -122.895

Amateur Radio Call: VE7WXS

Weather Satellite Imagery: http://wxsat.gelaken.ca
Personal Webpage         : http://ve7wxs.gelaken.ca



