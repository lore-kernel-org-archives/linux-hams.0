From: Basil Gunn <basil@pacabunga.com>
Subject: Re: Can only connect  to RMS gateway once
Date: Fri, 3 Jun 2016 13:16:13 -0700
Message-ID: <20160603131613.6037bcd0@brox.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> Have you tried to disable smp (in grub, boot the kernel with the
> cmdline option nosmp)? Did then the problem still occur?

I disabled SMP and the problem of socket remains open after disconnect
still occurs with kernels >= 4.2.

cat /boot/cmdline.txt
dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1
root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes
maxcpus=0 rootwait


I built a 4.1.21 kernel from the raspbian repo
https://github.com/raspberrypi/linux/tree/rpi-4.1.y

and the problem does NOT exist with that kernel.

I built a 4.2.8 kernel from the raspbian repo
https://github.com/raspberrypi/linux/tree/rpi-4.2.y

and the problem DOES exist with that kernel.
Showing connection listening after final disconnect.

Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
N7NIX-0    N7NIX-11   ax0     LISTENING    001/004  0       0
*          N7NIX-11   ax0     LISTENING    000/000  0       0


/Basil n7nix
