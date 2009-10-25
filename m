From: Bernard Pidoux F6BVP <f6bvp@free.fr>
Subject: [BUG] ax25-tools-0.0.10-rc2 : no netrom device attached
Date: Sun, 25 Oct 2009 11:26:28 +0100
Message-ID: <4AE427D4.4040802@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>
Cc: Ralf Baechle DL5RB <ralf@linux-mips.org>, ax25@x-berg.in-berlin.de

Hi,

nrattach does not create any nr# device despite a success message :

ax25-tools-0.0.10-rc2]# netrom/nrattach -m 236 netbbs
NET/ROM port netbbs bound to device nr2

ifconfig does not show any nr device !

Investigating nrattach source file revealed that a conditional compile
instruction was added.

Actually, #ifdef instruction included in nrattach.c prevents 
a call to startiface() funtion to be compiled.
This is because "notdef" is actually not defined by default.

I don't know exactly why this was added in nrattach source file but,
to keep backward compatibility with previous versions, the proposition
should be reversed, i.e. #ifdef replaced by #ifndef. 

The new code would look like the following :

#ifndef notdef
	if (!startiface(dev, hp))
		return 1;		
#endif
	printf("NET/ROM port %s bound to device %s\n", argv[optind], dev);

However, if notdef is defined somewhere, there will be again no netrom device
created, but a false success message will still be displayed.

I don't really understand the purpose of this.

73 de Bernard, f6bvp
