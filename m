From: "Wilson G. Hein" <wilson.hein@verizon.net>
Subject: RE: insmod mkiss
Date: Sun, 26 May 2002 21:33:49 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <NCBBKBAJDJIPKFIAFBKLCEJKEFAC.wilson.hein@verizon.net>
References: <200205251110.28295.lx2gt@qsl.net>
Reply-To: <whein3@earthlink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200205251110.28295.lx2gt@qsl.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams Mailing List <linux-hams@vger.kernel.org>

Thanks Luc

-----Original Message-----
>On Samstag, 25. Mai 2002 04:12, Wilson G. Hein wrote:
>> kernel-2.4.18 with patch-2.4.19-pre2
>>
>> When loading trhe mkiss module I get the following error
>>
>> Using /lib/modules/2.4.19-2A/kernel/drivers/net/hamradio/mkiss.o
>> /lib/modules/2.4.19-2A/kernel/drivers/net/hamradio/mkiss.o: unresolved
>> symbol ax25_rebuild_header_R4f0ceed4
>> /lib/modules/2.4.19-2A/kernel/drivers/net/hamradio/mkiss.o: unresolved
>> symbol ax25_encapsulate_Rf7eb0c11
>>
>> What up wit dat?-)
>>
>
>Hmm... is the ax25 module already loaded when you load the mkiss module?

That was it, I didn't load the ax25 module first. (blush)

Still learning about modules :-)

Which brings up another point. Why if I include the ax25/mkiss/netrom
modules in /etc/modules.conf don't they appear when running lsmod after boot
up?

Wilson

