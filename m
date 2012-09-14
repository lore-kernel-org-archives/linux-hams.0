From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: IP over and AX25IPD UDP connect does not workon kernals from
 2.6
Date: Fri, 14 Sep 2012 11:16:51 +0200
Message-ID: <20120914091651.GG32411@x-berg.in-berlin.de>
References: <FqAKqsBDluUQFwYb@skywaves.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <FqAKqsBDluUQFwYb@skywaves.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Lewis <paul@skywaves.demon.co.uk>, linux-hams@vger.kernel.org

Hello,

our systems with kernel 2.6 are running stable -since years- with ax25ipd
using axudp. We're also using IP. But in difference to your configuration,
we've configured the ARP address hard.

You describe a problem with IP over AX.25 (over UDP over IP).
Your trace shows ARP requests and ARP responses.
ax25ipd does not filter such packets. It passes all them to kernel.
If there's a problem, it's the kernel-ax25-code where to look at.

vy 73,
	- Thomas  dl9sau

On 2012-09-14 09:22:27 +0100, Paul Lewis <paul@skywaves.demon.co.uk>
wrote in <FqAKqsBDluUQFwYb@skywaves.demon.co.uk>:
> Hello All
> 
> IP over and AX25IPD UDP connect does not work on kernels from 2.6
> 
> net44 IP over AX25UDP does not work.
> I have never got this working on my remote partners system when they
> upgraded to the 2.6 kernels during the last decade.
> 
> So this problem has caught up with me again..
> 
> Works fine on my 2.2.26 kernel the version of ax25ipd that I am using
> nn my main server and installed 4.June 2007
> From my log updated  4.6.2007
> ax25-apps-0.0.6.2src_f6bvp.tar (bz2)
> ax25ipd is a dynamic version for DHCP enhancement.
> 
> 
> This is my test
> 244.4 is the Raspberry Pi Debian build
> 244.1 is the 2.2.26 system
> 
> Telnet from 244.4 to 244.1 over and axudp tunnel fails
> Can see the ARP requests over the AX25IPD UDP  axu2 Interface on
> both machine. Nothing seems to happen requests ignored.  In the past
> we have even entered static arp entries and still fails to establish
> the IP link
> 
> 
> Local Machine (244.4)
> sender IPaddr 44.131.244.4 hwaddr G4APL-11
> target IPaddr 44.131.244.1
> axu2: fm G4APL-11 to QST ctl UI pid=CD(ARP) len 30 07:13:31
> ARP: len 30 hwtype AX25 prot IP op REQUEST
> sender IPaddr 44.131.244.4 hwaddr G4APL-11
> target IPaddr 44.131.244.1
> 
> 
> Remote machine (244.1)
> axu2: fm G4APL-11 to QST ctl UI pid=CD(ARP) len 30 08:13:31
> ARP: len 30 hwtype AX25 prot IP op REQUEST
> sender IPaddr 44.131.244.4 hwaddr G4APL-11
> target IPaddr 44.131.244.1
> axu2: fm G4APL-2 to G4APL-11 ctl UI pid=CD(ARP) len 30 08:13:31
> ARP: len 30 hwtype AX25 prot IP op REPLY
> sender IPaddr 44.131.244.1 hwaddr G4APL-2
> target IPaddr 44.131.244.4 hwaddr G4APL-11
> 
> 
> I have seen this many times in the past (during the last decade)
> when my remote partners have upgraded from the 2.4 to 2.6 Kernels.
> And we loose our net44 links over ax25ipd udp links.
> Reverted to using VPN to overcome.
> 
> I have never been able to solve the problem as to why
> the later versions of kernel or ax25ipd does or handle IP over the
> ax25udp
> 
> IP over my AXUDP links worked to my current Partner(s)
> running xrouter, jnos and in the past BPQ partners.
> 
> Has anyone come across this and found a solution.  Or as might be
> the case. I may have missed something.
> 
> Currently testing on my Raspberry PI system.
> 73 Paul g4apl (gb7cip)
> 
> -- 
> paul@skywaves.demon.co.uk
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
