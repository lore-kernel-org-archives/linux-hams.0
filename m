From: "Wilson G. Hein" <wilson.hein@verizon.net>
Subject: HELP PMS
Date: Sat, 1 May 2004 09:33:22 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <NCBBKBAJDJIPKFIAFBKLKEOKEOAC.wilson.hein@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams Mailing List <linux-hams@vger.kernel.org>
Cc: dcb@vectorbd.com, terry@perf.no.itg.telecom.com.au

Greetings!

Here is a blast from the past. I'm looking to compile pms from the "old"
ax25-utils-2.1.42a. I initially got this error:

$ make all
Makefile:10: ../Makefile.include: No such file or directory
make: *** No rule to make target `../Makefile.include'.  Stop.

Since there is no Makefile.include in the pms directory I removed the
relevent code from the Makefile, just to see what would happen.

$ make all
gcc -Wall -Wstrict-prototypes -O2 -I../lib -c axcalluser.c
axcalluser.c:6:20: config.h: No such file or directory
make: *** [axcalluser.o] Error 1

Now apparently I'm also missing a config.h file.

Any help in locating the missing files, or suggestions on how I can make
this program work would be greatly appreciated.

Regards,

Wilson, WJ3G


---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.657 / Virus Database: 422 - Release Date: 4/13/2004

