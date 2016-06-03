From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Can only connect to RMS gateway once
Date: Fri, 3 Jun 2016 16:45:47 -0700
Message-ID: <575216AB.7000108@trinnet.net>
References: <20160603131613.6037bcd0@brox.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160603131613.6037bcd0@brox.localnet>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Basil Gunn <basil@pacabunga.com>, linux-hams@vger.kernel.org

Hey Basil,

Thanks for digging into this.  Few things to check:

GOOD - the 4.1.21 kernel was released on 4/6/16
BAD - 4.2.8 kernel was released on 12/16/15

Can you try a vanilla kernel with:
    - 4.2.7, released on 12/9/16 to see if that's OK
    - 4.1.25, released on 5/23/16 to see if that's ok?  (a worse case 
4.1.x test)

If 4.1.25 is bad:
    - Try 4.1.14, released on 12/9/15 to see if that's ok?

If that's ok, try:
    - 4.1.15 released on 12/15/15
    - 4.1.16 released on 1/23/16

--David




On 06/03/2016 01:16 PM, Basil Gunn wrote:
>> Have you tried to disable smp (in grub, boot the kernel with the
>> cmdline option nosmp)? Did then the problem still occur?
> I disabled SMP and the problem of socket remains open after disconnect
> still occurs with kernels >= 4.2.
>
> cat /boot/cmdline.txt
> dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1
> root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes
> maxcpus=0 rootwait
>
>
> I built a 4.1.21 kernel from the raspbian repo
> https://github.com/raspberrypi/linux/tree/rpi-4.1.y
>
> and the problem does NOT exist with that kernel.
>
> I built a 4.2.8 kernel from the raspbian repo
> https://github.com/raspberrypi/linux/tree/rpi-4.2.y
>
> and the problem DOES exist with that kernel.
> Showing connection listening after final disconnect.
>
> Active AX.25 sockets
> Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
> N7NIX-0    N7NIX-11   ax0     LISTENING    001/004  0       0
> *          N7NIX-11   ax0     LISTENING    000/000  0       0

