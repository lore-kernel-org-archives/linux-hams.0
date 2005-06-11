From: David Quental <ct1drb@iol.pt>
Subject: Re: Problems in my ax25 interface - did not work.
Date: Sat, 11 Jun 2005 22:40:16 +0100
Message-ID: <200506112240.17142.ct1drb@iol.pt>
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

Hello Stewart,

thanks for your help, but it did not work. 
> To stop Samba sending things on the AX25 interfaces make sure
> your smb.conf has a line like:
>
> 	interfaces = 192.168.21.1/24
I did it.
> To restrict it to using only the interfaces you need SMB to work over.
When I do rcax25 start there are a lot of sendings, via scc1 device from 
44.158.28.12 --> 224.0.0.251. That confuses me because of my lack about 
tcpip, sorry.
> --
> Stewart G0LGS
Best 73s.

CT1DRB
David Quental

> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
