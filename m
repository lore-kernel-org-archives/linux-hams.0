From: walter harms <wharms@bfs.de>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Mon, 07 Mar 2011 11:49:41 +0100
Message-ID: <4D74B845.4040600@bfs.de>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net> <4D73F262.6000703@exemail.com.au> <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Curt, WE7U" <curt.we7u@gmail.com>
Cc: linux-hams@vger.kernel.org



Am 07.03.2011 07:22, schrieb Curt, WE7U:
> On Mon, 7 Mar 2011, Ray Wells wrote:
> 
>> I did find this on an yam old mailing list ...
>>
>> *"Other problem f3kt cannot use yamser with a irq superior has 4."
>>
>> *http://sharon.esrac.ele.tue.nl/pub/packet/yam/guestbook.htm
>> *
>> *Jean-Paul, F6FBB recently appeared on the FBB mailing list; maybe he
>> can shed some light.
> 
> Roger.  I sent him similar messages and they didn't bounce (yet), so he
> may yet answer.  I'm not sure what f3kt is.
> 
> I tweaked yam.c in two places to allow IRQ's up to 99, then compiled and
> used the new driver.  Doing this:
> ---------------------------------------------------------------------
>     /sbin/modprobe -a yam
>     /bin/setserial /dev/ttyS5 uart none
>     /usr/sbin/yamcfg yam1 io 0xd880 irq 17 pers 128 txd 150 bitrate 9600
> baudrate 9600
>     /sbin/ifconfig yam1 mtu 256 hw ax25 WE7U-5
>     /sbin/ifconfig yam1 44.24.102.128 netmask 255.255.255.0
>     #/sbin/ifconfig yam1 up
> ---------------------------------------------------------------------


can you try to switch  /bin/setserial & /sbin/modprobe  ?
maybe some ttyS driver allocates /dev/ttyS5.

re,
 wh
