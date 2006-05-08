From: "Jose Ng Lee" <jng@psi.net.pa>
Subject: FC4 pty device kissattach
Date: Mon, 8 May 2006 10:26:56 -0500
Message-ID: <006201c672b3$d77acea0$2201a8c0@psi.net.pa>
Reply-To: "Jose Ng Lee" <jng@psi.net.pa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

I am trying to upgrade my old Redhat Linux 8.0 2.4.25 to Fedora Core 4
2.6.16.14.

So far have recompiled the kernel with AX25 and installed the AX25 tools,
apps, libs.

On rc.local included /sbin/MAKEDEV pty and /sbin/MAKEDEV tty to create de
devices each times the PC boots.

But, my problem is attaching the dev ptypf.

I confirmed on dev directory that the device is there:

crw-rw-rw-  1 root tty 2,  15 May  8 09:20 ptypf

Then I tried this line from my old RH8 and get and error:

[root@fedora dev]# /usr/sbin/kissattach /dev/ptypf lan 44.163.22.3
kissattach: open: No such device or address

Reading at man MAKEDEV it said something that:

       No such device normally means the kernel does not have the
       driver configured or loaded.

Does someone knows how to configure or load the driver?  Or where to look on
menuconfig to turn the dev ON to re-compile a new kernel.

Thanks,

JOSE / HP2AT

