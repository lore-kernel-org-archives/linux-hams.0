From: Luc Langehegermann <lx2gt@qsl.net>
Subject: Re: insmod mkiss
Date: Sat, 25 May 2002 11:10:28 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200205251110.28295.lx2gt@qsl.net>
References: <NCBBKBAJDJIPKFIAFBKLIEJGEFAC.wilson.hein@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <NCBBKBAJDJIPKFIAFBKLIEJGEFAC.wilson.hein@verizon.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: whein3@earthlink.net, "Wilson G. Hein" <wilson.hein@verizon.net>, Linux-Hams Mailing List <linux-hams@vger.kernel.org>

On Samstag, 25. Mai 2002 04:12, Wilson G. Hein wrote:
> kernel-2.4.18 with patch-2.4.19-pre2
>
> When loading trhe mkiss module I get the following error
>
> Using /lib/modules/2.4.19-2A/kernel/drivers/net/hamradio/mkiss.o
> /lib/modules/2.4.19-2A/kernel/drivers/net/hamradio/mkiss.o: unresolved
> symbol ax25_rebuild_header_R4f0ceed4
> /lib/modules/2.4.19-2A/kernel/drivers/net/hamradio/mkiss.o: unresolved
> symbol ax25_encapsulate_Rf7eb0c11
>
> What up wit dat?-)
>

Hmm... is the ax25 module already loaded when you load the mkiss module?

Luc.


> Wilson WG3G
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

