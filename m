From: Larry Levesque <ka1vgm@gmail.com>
Subject: Re: Link Win/BPQ32 >< Lin/FPAC
Date: Sun, 11 Mar 2012 09:49:41 -0400
Message-ID: <20120311134941.GA16669@user-desktop>
References: <4F5CAAAA.3030605@eunet.rs>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=IAiDdAYbWVYhnAP0P7xGzuVi5XKWIkVcP5hJpA98OtE=;
        b=pk6riq+iO+UPyz+NJPDamDxY9oSKrSXze20k8y/lt4TyoZ3mf12pS51sjfZF3+EcOQ
         RasDpi1Fy05hJfAIq5ms4w/YyukSqpMjgHaLsxRpL1wmbaIysJgJsPl98+UX3nCxzgww
         tGclyaqY1uS40hISTFYQeI1ZfZ/wUSZPzSs7Cf5Mohayka9PbF8p61gPBgbosPBAchHM
         XdSUSxb0Sdqnygpl60RqpUtsLD2OWrC1E1PwOYLE/uqYpKJuGbedhWgIv9x7FFDMCtPk
         Z+1Lg3I0R12UPczP+Xk6lUBZv7IXyolpBieKwy2/6HLgPlDAxn6F4b5o1BKQ3X7Rg4tN
         rUDg==
Content-Disposition: inline
In-Reply-To: <4F5CAAAA.3030605@eunet.rs>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miroslav Skoric <skoric@eunet.rs>
Cc: linux-hams@vger.kernel.org

First things first, put your ax stuff in another subnet. Hams usually
use the 44.*.*.* series. 



On Sun, Mar 11, 2012 at 02:37:46PM +0100, Miroslav Skoric wrote:
> Hi all,
> 
> I have three BPQ32 machines in the home  LAN and they talk each
> other by using bpqether ports.  One machine has two network cards
> and the other two have one card each, so the box with two cards
> interconnect all three boxes in a 'chain':
> 
> 
>                 _____________       ______________     ______________
> VHF          | BPQ32 4.10f  |     |  BPQ32 4.10f    |   | BPQ32 4.10f    |
> TRX-TNC2-|                    | -- | FPAC 3.28.18   |--|       |
> ant           |____________|     |______________|   |_____________|
> 
>                         (1)                        (2)         (3)
> 
>                  192.168.1.2   <-->    192.168.1.1
>                                               192.168.0.1    <-->
> 192.168.0.2
> 
> 
> All comps are dual-boot. The box with two NICs is dual-boot with
> Debian 6.0.4 and I put FPAC 3.28.18 there. I managed to force FPAC
> talking via bpq0 (eth0) to the BPQ32 comps.
> 
> Although the three nodes communicate each-other, I discovered an
> annoying traffic of FPAC filling up the BPQ32 monitoring screen: In
> fact, it sends the rows bellow continually to the box (3), on the
> right in the Fig. above:
> 
> 12:52:53R YT7MPB-15>QST Port=1 <UI> <ARP Request> Who Has
> 192.168.0.2? Tell 192.168.0.1
> 12:52:54R YT7MPB-15>QST Port=1 <UI> <ARP Request> Who Has
> 192.168.0.2? Tell 192.168.0.1
> 12:52:55R YT7MPB-15>QST Port=1 <UI> <ARP Request> Who Has
> 192.168.0.2? Tell 192.168.0.1
> 12:52:57R YT7MPB-15>QST Port=1 <UI> <ARP Request> Who Has
> 192.168.0.2? Tell 192.168.0.1
> 12:52:58R YT7MPB-15>QST Port=1 <UI> <ARP Request> Who Has
> 192.168.0.2? Tell 192.168.0.1
> 
> ... and the similar traffic it sends to the box (1), on the left in
> the Fig. above:
> 
> 12:52:59R YT7MPB-14>QST Port=1 <UI> <ARP Request> Who Has
> 192.168.1.2? Tell 192.168.1.1
> 12:53:01R YT7MPB-14>QST Port=1 <UI> <ARP Request> Who Has
> 192.168.1.2? Tell 192.168.1.1
> 12:53:02R YT7MPB-14>QST Port=1 <UI> <ARP Request> Who Has
> 192.168.1.2? Tell 192.168.1.1
> 12:53:03R YT7MPB-14>QST Port=1 <UI> <ARP Request> Who Has
> 192.168.1.2? Tell 192.168.1.1
> ...etc ...
> 
> To locate the issue, I reboot the box in the middle to Win/BPQ32
> again, and the production of those funny lines stops. Any idea?
> 
> By the way, ifconfig returns the following:
> 
> root@localhost:/home/misko# ifconfig
> ax0       Link encap:AMPR AX.25  HWaddr YT7MPB-15
>           inet addr:192.168.0.1  Bcast:192.168.0.255  Mask:255.255.255.0
>           UP BROADCAST RUNNING  MTU:255  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:10
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
> 
> bpq0      Link encap:AMPR AX.25  HWaddr YT7MPB-15
>           inet addr:192.168.0.1  Mask:255.255.255.0
>           UP RUNNING  MTU:256  Metric:1
>           RX packets:95 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:2477 (2.4 KiB)  TX bytes:0 (0.0 B)
> 
> bpq1      Link encap:AMPR AX.25  HWaddr YT7MPB-14
>           inet addr:192.168.1.1  Mask:255.255.255.0
>           UP RUNNING  MTU:256  Metric:1
>           RX packets:71 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:2336 (2.2 KiB)  TX bytes:0 (0.0 B)
> 
> eth0      Link encap:Ethernet  HWaddr 94:0c:6d:80:4d:83
>           inet addr:192.168.0.1  Bcast:192.168.0.255  Mask:255.255.255.0
>           inet6 addr: fe80::960c:6dff:fe80:4d83/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:2547 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:2550 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:198452 (193.8 KiB)  TX bytes:164246 (160.3 KiB)
>           Interrupt:5 Base address:0xe800
> 
> eth1      Link encap:Ethernet  HWaddr 00:10:4b:2e:da:df
>           inet addr:192.168.1.1  Bcast:192.168.1.255  Mask:255.255.255.0
>           inet6 addr: fe80::210:4bff:fe2e:dadf/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:1446 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:2532 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:117209 (114.4 KiB)  TX bytes:160870 (157.0 KiB)
>           Interrupt:11 Base address:0xe400
> 
> lo        Link encap:Local Loopback
>           inet addr:127.0.0.1  Mask:255.0.0.0
>           inet6 addr: ::1/128 Scope:Host
>           UP LOOPBACK RUNNING  MTU:16436  Metric:1
>           RX packets:8 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:560 (560.0 B)  TX bytes:560 (560.0 B)
> 
> nr0       Link encap:AMPR NET/ROM  HWaddr YT7MPB-3
>           inet addr:192.168.0.1  Mask:255.255.255.0
>           UP RUNNING NOARP  MTU:235  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
> 
> nr1       Link encap:AMPR NET/ROM  HWaddr YT7MPB-4
>           inet addr:192.168.0.1  Mask:255.255.255.0
>           UP RUNNING NOARP  MTU:235  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
> 
> nr2       Link encap:AMPR NET/ROM  HWaddr YT7MPB-3
>           inet addr:192.168.1.1  Mask:255.255.255.0
>           UP RUNNING NOARP  MTU:235  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
> 
> nr3       Link encap:AMPR NET/ROM  HWaddr YT7MPB-4
>           inet addr:192.168.1.1  Mask:255.255.255.0
>           UP RUNNING NOARP  MTU:235  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
> 
> rose0     Link encap:AMPR ROSE  HWaddr 2200210000
>           inet addr:192.168.0.1  Mask:255.255.255.0
>           UP RUNNING NOARP  MTU:251  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
> 
> root@localhost:/home/misko#
> 
> 
> Misko
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Larry Levesque
www.surrycomputerservices.com
