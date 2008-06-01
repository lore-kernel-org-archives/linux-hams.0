From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: BUGs into libax25
Date: Mon, 02 Jun 2008 00:26:19 +0200
Message-ID: <4843220B.20703@upmc.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>
Cc: Ray Wells <vk2tv@exemail.com.au>, Charlie k4gbb <k4gbb1@earthlink.net>, Jerry DeLong <KD4YAL@tampabay.rr.com>, F1TE <f1te@f1te.org>, f8arr <f8arr@f8arr.org>, Ralf Baechle DL5RB <ralf@linux-mips.org>

Hi All,

I found a number of BUGs into libax25 that may affect nearly ALL AX25 
applications for it is in ax25_aton_entry() function that is used to 
translate a callsign into AX25 format.
Programs like kissattach, listen, ax25ipd, FPAC, xfbbd are concerned.

The code would return an error with 6 letters callsigns.


The second set of errors is in /proc/ax25/ timers format description.
since timers are now in millisec, they require a larger storage size.
This results in using unsigned long integers rather than unsigned short 
integers.

Ax25-tools and ax25-apps must be recompiled after recompilation and 
installation of this new libax25 version.
FPAC and LinuxFBB also.

I patched my own source of libax25 and uploaded it here :

http://f6bvp.free.fr/logiciels/ax25/libax25-0.0.11.5src_f6bvp.tgz

Here is the new ChangeLog entry :

libax25 0.0.11.5
         * BUG in axutils.c
           function ax25_aton_entry() was only testing 5 callsign 

           characters.
           A lot of ax25-tools and AX25 applications using this library
           function, including FPAC, could have problems with 6 letters
           callsigns. Corrected.

         * BUG in proc_ax25 structure timers members size declared in
           procutils.h. Since in kernel 2.6 the timers are now in 
milliseconds,
           they need more place to be saved (unsigned short --> unsigned 
long).
         * corrected, together with functions reading proc files in 
procutils.c.

  -- Bernard Pidoux <f6bvp@amsat.org>  Jun 1 2008


73 de bernard, f6bvp
