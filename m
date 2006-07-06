From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: RE: kissattach/kissnetd versus ptyq ttyq and ptmx/pts
Date: Thu, 6 Jul 2006 05:56:44 -0400
Message-ID: <000301c6a0e2$7d085930$3749a8c0@lan.w1nr.net>
References: <44AB6C66.4050000@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <44AB6C66.4050000@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Cathryn Mataga' <cathrynm@junglevision.com>
Cc: linux-hams@vger.kernel.org

I seem to recall that you need to select this support when the kernel is
built.  You also need to select KISS and AX.25 support as well.  I would try
recompiling the kernel with these enabled.

I just looked on my SuSE 10.1 system (kernel 2.6.16) and the pty devices are
there (SuSE enables most everything in the default kernel as well as mkiss
and ax25) so the kernel must still support it.

What were you using before going to FC4?  I made the switch from RH to SuSE
mainly to avoid having to recompile kernels all the time.  Also I find the
SuSE system management much more robust than Fedora.

Mike, W1NR

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Cathryn Mataga
Sent: Wednesday, July 05, 2006 3:38 AM
To: unlisted-recipients:; no To-header on input
Cc: linux-hams@vger.kernel.org
Subject: kissattach/kissnetd versus ptyq ttyq and ptmx/pts

In my original Linux ham radio setup, I had the following...

/sbin/kissnetd -f 1064 /dev/ptyq3 /dev/ptyq4& sleep 4 /sbin/kissattach -l
/dev/ttyq3 lb1 192.168.0.2& /sbin/kissattach -l /dev/ttyq4 lb2 192.168.0.3&

for creating the loopback device.

Seems that in Fedora 4 ptyq3 and ttyq3 don't exist anymore.  I tried using
MAKENODE ptyq3 and ttyq3 to create these device files, but I don't think
they're working?  I get this error.

kissattach: open: No such device or address

I've been googling the pseudo terminals for Linux and it seems that the new
way is with ptmx/pts and ptyq3 and ttyq3 are the old style.  But I'm not
sure, will kissattach works with these? Or is there a way to get ptyq3 ttyq3
working in Fedora 5?

What's the right way to go about this, these days?
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html


