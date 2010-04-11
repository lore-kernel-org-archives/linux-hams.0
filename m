From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: AX25 patches and new FPAC 327.14-pre23 release
Date: Sun, 11 Apr 2010 10:25:20 +0200
Message-ID: <20100411082520.GQ7246@x-berg.in-berlin.de>
References: <4B93F367.1000803@free.fr> <4B955E3C.2010303@free.fr> <4B95B589.5080000@embarqmail.com> <4B961217.1080002@free.fr> <4B998055.8040006@gmail.com> <4B9AAE22.9090307@upmc.fr> <4B9AE3F0.8050504@gmail.com> <4B9B68E8.70805@upmc.fr> <4B9C3A18.60605@xtra.co.nz> <4BC0B44B.1060707@upmc.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4BC0B44B.1060707@upmc.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <bernard.pidoux@upmc.fr>
Cc: C Schuman <k4gbb1@embarqmail.com>, bobtenty@gmail.com, Jerry DeLong <KD4YAL@tampabay.rr.com>, Ray Wells <vk2tv@exemail.com.au>, List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>, linux-hams <linux-hams@vger.kernel.org>

Hello,

On 2010-04-10 19:24:27 +0200, Bernard Pidoux <bernard.pidoux@upmc.fr>
wrote in <4BC0B44B.1060707@upmc.fr>:
> Hi All,
>
> Ax25 libraries, ax25-apps and ax25-tools available under -rc2 label
> have a number of bugs that prevent ROSE network application FPAC to work properly.

Unfortunately, Bernard does not send diffs for patches.
I'd to do it on my own and comment it here.

> List of main bugs in libax25 :
> - in /usr/local/include/netax25/procutils.h, use entry is missing   in 
> struct proc_rs_neigh

fixed in CVS head:

http://www.linux-ax25.org/cvsweb/libax25/netax25/procutils.h.diff?r1=1.1;r2=1.2;f=h

 Revision 1.2: download - view: text, markup, annotated - select for diffs
Thu Nov 26 17:37:41 2009 UTC (4 months, 1 week ago) by dl9sau
Branches: MAIN
CVS tags: HEAD
Diff to: previous 1.1: preferred, colored
Changes since revision 1.1: +20 -19 lines

patch submitted by Bernard Pidoux f6bvp
- in proc_ax25 structure timers members size declared in
  procutils.h. Since in kernel 2.6 the timers are now in milliseconds,
  they need more place to be saved (unsigned short --> unsigned long).
- in procutils.h and procutils.c
  in structure proc_rs_neigh field "use" was missing,
  in function read_proc_rs_neigh proc_rs_neigh use was not read

> - in procutils.c, ax25_aton_entry(const char *name, char *buf)  first 
> while loop is < 6 and should be < 7 to allow checking minus character 
> before SSID
>  in six letters callsigns.

It's not procutils.c but axutils.c.

Your proposed diff is:

+++ libax25-0.0.12-rc2.patched_f6bvp/axutils.c  2010-04-07 22:38:09.000000000 +0200
@@ -24,14 +24,14 @@
        const char *p = name;
        char c;
 
-       while (ct < 6) {
+       while (ct < 7) {
[..]
+       while (ct < 7) {
                buf[ct] = ' ' << 1;
                ct++;
        }

I don't know what your problem was and what it should fix.
But I see, that the while loop has a correct count for a callsign with
a maximum of 6 letters (with "DL9SAU", starting with ct = 0, for
processing "U", ct is = 5 and at the bottom, ct is incremented to 6.
Then it is not < 6 anymore and the while loop is left. This is exactly
the expected behaviour. 

The next while loop fills the rest with shifted blanks for the "buf" in
network-byte-order. buf is sizeof(7); the last position is buf[6] and
contains the SSID. It needs not to be filled with ' ', beause a few lines
later we force it to be assigned, with:
buf[6] = ((ssid + '0') << 1) & 0x1E;

-> I've to reject that patch.

> In ax25apps, application ax25ipd has been added a dynamic DNS option and 
> more. Read ax25ipd History.  

It seems to implement Cathryn's threded-resolving-patch, and others.
I've to look at it deeper. ax25ipd is a "monster".

> In ax25tools, a bug in nrattach, prevented initializing NetRom devices.

Already fixed in CVS head:
http://www.linux-ax25.org/cvsweb/ax25-tools/netrom/nrattach.c.diff?r1=1.3;r2=1.4;f=h

Revision 1.4: download - view: text, markup, annotated - select for diffs
Mon Nov 2 12:24:14 2009 UTC (5 months, 1 week ago) by dl9sau
Branches: MAIN
CVS tags: HEAD
Diff to: previous 1.3: preferred, colored
Changes since revision 1.3: +0 -2 lines

	Fix for a problem I introduced in 2005.
	Thanks to Bernard <f6bvp> for reporting this problem.

> Patched rc2 source packages are available from here :
>
> http://f6bvp.free.fr/logiciels/ax25/libax25-0.0.12-rc2.patched_f6bvp.tar.bz2
> http://f6bvp.free.fr/logiciels/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp.tar.bz2
> http://f6bvp.free.fr/logiciels/ax25/ax25-tools-0.0.10-rc2.patched_f6bvp.tar.bz2

btw, your tar-balls contain directory mode 777. This may cause security
problems.

> 73 de Bernard, f6bvp

73,
	- Thomas  dl9sau
