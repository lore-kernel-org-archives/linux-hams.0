From: Bill WA7NWP <wa7nwp@jnos.org>
Subject: Re: AX25 to Telnet to CONV
Date: Sun, 11 Dec 2005 13:54:49 -0800
Message-ID: <439CA029.5030904@jnos.org>
References: <4398A8E5.70500@jnos.org>  <0006$01c12a35$017630fc@arti> <200512082202.jB8M21Rh020813@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200512082202.jB8M21Rh020813@yagi.h-net.msu.edu>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


>  > I'd like a Connect Request to WA7NWP-17 to run the command 'telnet
>  > wetnet.net 3600' to hook up to the CONVER server.
> 
> You can use ax25d to invoke a command and hook its std{in,out} up
> to the AX25 socket.  You could use telnet, but I use a shim called
> axconv to create the socket connection to the convers server; it does
> line ending fixup, will auto-sign the caller into convers, etc.
> 
> 	http://he.fi/pub/ham/unix/linux/ax25/axconv.c.gz


This is working great and I'm currently putting it in place at the 2nd 
and 3rd system.   The problem is, like with all great little tools, one 
improvement on the system like this and an obsessive individual, like me 
, want's more more more...

Time now to take the next step and hook our "community packet servers" 
up to the local DXCluster box using the same AX25 connect and launch scheme.

Is anybody already doing this?  I think the axconv.c program might work 
directly or with a little tweaking.   Also I saw once, but can't find 
now, instructions on how to launch a telnet connection from ax25d.conf. 
  It would be much appreciated if somebody could point me at that info. 
  Any other hints and suggestions would also be appreciated.

73,
Bill - WA7NWP (making lots of packets...)
