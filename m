From: David Quental <ct1drb@iol.pt>
Subject: Re: Problems in my ax25 interface - more infos.
Date: Sat, 11 Jun 2005 23:09:59 +0100
Message-ID: <200506112309.59831.ct1drb@iol.pt>
References: <OMEGIMHHANGHDCMEGEJCEEBDCCAA.g0lgs@gb7lgs.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <OMEGIMHHANGHDCMEGEJCEEBDCCAA.g0lgs@gb7lgs.co.uk>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

Hello to all again.

I can add more infos about my setup:
right now I am using SuSE 9.3, most of times I use KDE, it has some net 
services under icon my network. If I open this icon there are, at least, 3 
services:
net services, slp services and smb shares.

If I enable all of these services I see a lot of tcpip frames in interface 
scc1, frames from 44.158.28.12 to another ip's.

Hope this can help you, thanks in advance.
> To stop Samba sending things on the AX25 interfaces make sure
> your smb.conf has a line like:
>
> 	interfaces = 192.168.21.1/24
>
> To restrict it to using only the interfaces you need SMB to work over.
>
> --
> Stewart G0LGS
Best 73s.

CT1DRB
David Quental


> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
