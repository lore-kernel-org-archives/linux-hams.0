From: Basil Gunn <basil@pacabunga.com>
Subject: Can only connect to RMS gateway once
Date: Thu, 2 Jun 2016 12:46:08 -0700
Message-ID: <20160602124608.29163c27@brox.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

This problem was was originally described on the Linux RMS-Gateway
group in March.

I've done a little investigation on the 'Can only connect to gateway
once' problem. RMS Gateway is definitely broken when running on
kernels after 4.1.6 or so. My 4.1.6 kernel didn't exhibit symptoms but
as mentioned previously a 4.2.0 kernel didn't work. My 4.4.10 kernel
doesn't work as well and I'm assuming the problem persists in the
latest kernels.

Using 'netstat --ax25' this is the expected reponse. You can see the
connection in operation between N7NIX-0 & N7NIX-11.

Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
N7NIX-0    N7NIX-11   ax0     ESTABLISHED  000/001  2112    0
*          N7NIX-11   ax0     LISTENING    000/000  0       0

After the connection the sockect for N7NIX-0 should go away as shown
below:

Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
*          N7NIX-11   ax0     LISTENING    000/000  0       0

On kernels newer then 4.1.6 the N7NIX-0 socket connection lingers
around and N7NIX can no longer connect to N7NIX-11.

Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
*          N7NIX-11   ax0     LISTENING    000/000  0       0
N7NIX-0    N7NIX-11   ???     LISTENING    001/004  0       0
N7NIX-0    N7NIX-11   ???     LISTENING    001/004  0       0
N7NIX-0    N7NIX-11   ???     LISTENING    001/004  0       0
N7NIX-0    N7NIX-11   ???     LISTENING    001/004  0       0

If I 'ifconfig down' the device, kill kissattach and reattach I can
connect once, again.  There have been many changes in the net/ax25
files since kernel version 4.1.6 and I'm guessing that it is something
that has changed there that is causing problems for RMS Gateway or
ax25d.

/Basil n7nix
