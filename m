From: Brett Mueller <wa7v@wa7v.com>
Subject: Process UID changes while running
Date: Sat, 19 Nov 2005 20:11:05 -0800
Message-ID: <437FF759.9040705@wa7v.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I'm not completely sure this is Linux-Hams specific, but I know there
are several hams on here who are quite knowledgeable about kernel
workings.  Sorry in advance if this is too far OT.

I'm not a Linux newbie, but this one has me stumped.  The following
applies to a Slackware 8.1 box running the 2.4.31 kernel with the 9A4GL
AX.25 patch cluster, and TNOS 2.40, on AMD K6-2/500, 512MB RAM hardware.

After some variable period of TNOS uptime, the ownership of the TNOS
process running on my box changes (it appears to decrement) while the
process is actually running.  The program normally runs as root (I know,
this is less than ideal).  After the change occurs, the output of ps
shows TNOS running with a UID of 65535.  TNOS is able to continue
reading and writing to files that are always open (such as log files),
but is unable to write to any others (such as mail files).  After TNOS
restarts, everything works fine until the next occurrence.  This problem
started happening much more frequently a couple of months ago -- often
once every 1 to 3 days.  I've encountered it with both 2.4.24 and 2.4.31
kernels, both of which I compiled with 9A4GL patches (the 2.4.24 kernel
I did almost 2 years ago).  None of the other processes running on this
box (including LinuxNode, (X)Net, LinFBB, etc.) ever have this happen
that I have noticed.  I've searched log files for clues, but find
nothing that catches my attention.

Here's two examples of ps output that I captured from it a couple of
weeks ago.  Note that they are the same PID, one ps listing performed
less than 4 hours after the other:

wa7v@alw:~> ps auxw | grep TNOS
root      9693  0.2  0.5  3088 2672 ?        S    06:59   0:33
- -TNOS2.40/U (Not Registered) - UP: 0:04:18:11

wa7v@alw:~> ps auxw | grep TNOS
#65535    9693  0.1  0.5  3116 2708 ?        S    06:59   0:50
- -TNOS2.40/U (Not Registered) - UP: 0:08:02:53

Here's the full listing of the binary:
- -rwxr-xr-x    1 root     root      4896530 Jan 24  2004 tnos*

Anyone have any ideas what could be causing this?  Other places that I
could look for clues?  Some method of changing a running process's UID
back to where it belongs?  Other information that I can provide?

Thanks all & 73,

Brett, WA7V

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (MingW32)

iD8DBQFDf/dZ+/Ps1x4JxWYRAnc1AJ4syP6/Z9H/sLYGKanRz46t3Z/xcwCfRhjG
XEpTsByodZ9ehjoR0fRdlK8=
=dzpI
-----END PGP SIGNATURE-----
