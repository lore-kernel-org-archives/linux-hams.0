From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: RE: AX25 on SUSE 10.0
Date: Sun, 6 Aug 2006 20:47:12 -0400
Message-ID: <000c01c6b9bb$0555cd90$3a49a8c0@lan.w1nr.net>
References: <3107.24.17.80.88.1154885072.squirrel@www.jnos.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3107.24.17.80.88.1154885072.squirrel@www.jnos.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wa7nwp@jnos.org, linux-hams@vger.kernel.org

SuSE 10.0 uses kernel 2.6.13 which has a broken mkiss interface as you
suspect.

I am running 10.1 with AX.25 on three systems including my DXSpider cluster
node just fine.  The AX.25 stuff is compiled into the default kernel as
modules.  Ham software like the AX.25 utilities is now packaged by others.
libax25.so is on the ftp installation sources or you can use my repackaging
of the 10.0 stuff with libax25.so included at ftp://ftp.w1nr.net/suse-ham/.

SuSE seems to have decided to go with no more than 5 CD's, therefore there
are many packages left off the CD's but are available via ftp.

You basically add ftp installation sources with YaST to point to the ham
packages and an "inst-source" and "non-oss-inst-source" off a mirror and
everything will be available to you.

Mike, W1NR


-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of wa7nwp@jnos.org
Sent: Sunday, August 06, 2006 1:25 PM
To: linux-hams@vger.kernel.org
Subject: AX25 on SUSE 10.0


We tried to turn on AX25 in a SuSE 10.0 system yesterday.  It was an
educational experience.

Suse no longer directly supports or includes the AX25 packages.

AX25 is indirectly supported as a 'project' by one of the SUSE folk.

That AX25 project is missing one little piece 'libax25.so'

Even if that all worked, it's using kernel 2.6.13 which I believe is broken
for MKISS.

Do anybody have AX25 working on a recent SUSE system?   Is there a
cookbook checklist of how to install and get it going?

Is there any Linux distributions today that are AX25 ready without any
futzing around?  It appears the system we were working on is going to go
with XP-Pro since it's so much easier to set up and use.

Thanks,
Bill - WA7NWP

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html


