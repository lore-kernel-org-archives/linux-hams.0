From: "Wilson G. Hein" <vze2b869@verizon.net>
Subject: RE: colrconv-0.99.2.tar.gz
Date: Wed, 25 Dec 2002 20:41:52 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <NCBBKBAJDJIPKFIAFBKLMECOEHAC.vze2b869@verizon.net>
References: <Pine.LNX.4.33.0212251856360.11307-100000@zoef.pe1icq.ampr.org>
Reply-To: <whein3@earthlink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0212251856360.11307-100000@zoef.pe1icq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams Mailing List <linux-hams@vger.kernel.org>

Thanks to all who responded. Now on to a new problem. I went to make the
sorce and get the following error;

[root@HGW colrconv-0.99.2]# make colrconv
gcc -Wall -I/usr/include/ncurses colrconv.c -lncurses -o colrconv
colrconv.c:15:21: ncurses.h: No such file or directory
make: *** [colrconv] Error 1

Indeed the file is not there, but where do I get it?

[root@HGW colrconv-0.99.2]# rpm -q ncurses
ncurses-5.2-26

Any suggestions?

Willie

