From: Riley Williams <rhw@InfraDead.Org>
Subject: Re: Linux LSR Safety Check
Date: Sun, 23 Jun 2002 07:43:07 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0206230738170.15173-100000@Consulate.UFP.CX>
References: <3D153227.8334EEDC@increa.com>
Reply-To: Riley Williams <rhw@InfraDead.Org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3D153227.8334EEDC@increa.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Mork <deusenet@increa.com>
Cc: Linux Ham Radio <linux-hams@vger.kernel.org>

Hi Brian.

>> I'm trying to upgrade my kernel from 2.2.16 to 2.4.2 but I'm having
>> problems with my serial ports. Basically, none of them seem to work,
>> and this includes my mouse on /dev/ttyS0 !
>>
>> What happens is that I get a message "LSR safety check engaged!".
>> I've had a glance at the source code to see if I can work out what
>> it's trying to do, but no joy.
>>
>> Has anyone else had this problem, or know how to solve it ?

> I have the same problem with Mandrake Linux v8.0.
>
> The mouse works fine during the install. When XF86 runs, the mouse
> locks up. I get an LSR Safety Check on ttyS0.
>
> Did you ever discover how to fix this?

Which kernel does Mandrake 8.0 use?

As a data point, I have Red Hat 7.3 on one of my systems, which runs
kernel 2.4.18, and no such problem occurs on that system. Admittedly,
the mouse is on ttyS1 rather than ttyS0 but from the above comments,
that wouldn't make the slightest difference.

Best wishes from Riley G7GOD / KB8PPG

