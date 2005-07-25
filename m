From: Thomas Sailer <sailer@sailer.dynip.lugs.ch>
Subject: Re: usermode soundmodem
Date: Mon, 25 Jul 2005 10:14:50 +0200
Message-ID: <1122279290.5240.20.camel@playstation2.hb9jnx.ampr.org>
References: <20050724111036.GI32031@router.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050724111036.GI32031@router.lan>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Werner <awerner@wired-brain.de>
Cc: linux-hams@vger.kernel.org

On Sun, 2005-07-24 at 13:10 +0200, Alexander Werner wrote:

> what do i have to do now??
> # ifconfig ax0
> ax0       Link encap:AMPR AX.25  HWaddr LINUX-1  
>           inet addr:10.0.0.1  Bcast:10.0.0.255  Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:256  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:10 
>           RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
> # lsmod
> tells me, that mkiss was loaded
> 
> or do i need to run kissattach?
> it seems simple - but i did not find anything on the web

Why do you want to run kissattach? You do have an ax25 interface, don't
you? soundmodem does the equivalent as kissattach by itself.

Now you need to configure the AX.25 interface ax0 with your callsign and
IP address, this should be described in the AX25 howto.

Tom


