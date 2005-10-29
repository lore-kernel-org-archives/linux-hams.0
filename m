From: aa6qn@aa6qn.sytes.net
Subject: Re: txdelay and kissparms hardware question
Date: Sat, 29 Oct 2005 16:44:13 -0700 (PDT)
Message-ID: <63925.192.168.1.2.1130629453.squirrel@192.168.1.12>
References: <60418.192.168.1.2.1130098885.squirrel@192.168.1.12>
    <20051029204357.GD2935@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051029204357.GD2935@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: aa6qn@aa6qn.sytes.net, linux-hams@vger.kernel.org

> On Sun, Oct 23, 2005 at 01:21:25PM -0700, aa6qn@aa6qn.sytes.net wrote:
>
>> I am wondering is kissparms configuration is really working for me. I
>> have
>> made adjustments and there seems to be no change in the tnc timing. For
>> instance if I set txdelay to -t 30 the tnc acts as if it was set to
>> 10ms.
>> I am wondering if the timing is effected by the faster machines
>> available
>> today. In my case its a Intel 4, 3.2Ghz hyperthreading dual channel SMP
>> image. Could this hardware also be the cause of my kernel panic's when I
>> load ax25?
>
> In case you're using the kiss driver the kernel should just forward this
> setting to your TNC which then controls the actual tx delay.  Other
> drivers
> such as 6pack do the tx delay themselves.  So, what driver are you using?
>
> 73 de DL5RB op Ralf
>
> --

I was using kissparms to adjust the timing. The input from another person
did help to change the kernel timing to 1000HZ.

Even then the system was still not stable. I have tabled the ax25 suite in
favor of JNOS2 which has been very solid with the latest kernel and Gentoo
linux. Its all working (tunnels, netrom, iptables, snort...) with uDev
etc.

Thank you for your time and help.
JohnF




