From: "AA6QN" <AA6QN@pacbell.net>
Subject: RE: mkiss, udev and kernel 2.6
Date: Thu, 11 Nov 2004 16:56:40 -0800
Message-ID: <000601c4c852$79768360$07001aac@adminqn>
References: <4187BA73.2080908@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4187BA73.2080908@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Bernard Pidoux' <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

I ported my Linux over to Gentoo and started off with devfs. I did try udev
and it did not work for me. So, back to devfs and things are working once
again. Let us know if you get it running.

73,John AA6QN

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Bernard Pidoux
Sent: Tuesday, November 02, 2004 8:49 AM
To: unlisted-recipients:; no To-header on input
Cc: linux-hams@vger.kernel.org
Subject: mkiss, udev and kernel 2.6

Hi,

Does someone have an experience with mkiss and udev in 2.6 kernel ?

I need to use mkiss-kissattach to drive a dual port TNC 1200/9600 KPC9612.

However I don't see how to set up a master-slave pseudo tty system with 
udev.

Actually, I went through by instructing the kernel to load devfs at boot 
(append="devfs=mount... " in lilo.conf.

But Is there any other solution with udev alone (without devfs) ?

73 de Bernard, f6bvp
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

