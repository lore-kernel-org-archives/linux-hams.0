From: f6bvp <f6bvp@free.fr>
Subject: [ROSE] Bug : waiting for rose module to become free
Date: Sat, 16 Feb 2019 19:44:23 +0100
Message-ID: <20190216194423.3727d498@draws-f6bvp>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netdev@vger.kernel.org, linux-hams@vger.kernel.org
Cc: dvyukov@google.com, richard@rns-stearn.co.uk, thomas@osterried.de, f6bvp@amsat.org

Hi,
A nastly bug is still pending in ROSE module that prevents it to be removed.
When trying to remove rose module we enter into an endless loop with displayed message :
 "waiting for rose module to become free"
A patch from Richard Stern had been committed a while ago but it did not get a chance to be applied.

https://marc.info/?l=linux-hams&m=150870350516064&w=2

Since then, there have been some changes in af_rose.c and net code architecture that prevents simply adding missing dev_put(dev) in present kernel.

From time to time we can observe a negative count (-1 for integer value is displayed as 65535 in /proc/net/rose_neigh) that probably means there is a bug in rose module refcount (??).

/proc/net/rose_neigh
00015 SV1HCC-9  ax0      2   1  DCE     yes   0   0
00013 PE1OWG-11 ax0      2 65535  DCE     yes   0   0
00011 F5KTR-11  ax0      1   1  DCE     yes   0   0
00007 F3KT-11   ax0      2   1  DCE     yes   0   0
00003 SK7ES-9   ax0      2   1  DTE     yes   0   0
00002 K4GBB-9   ax0      4   0  DCE     yes   0   0
00001 RSLOOP-0  ???      1   2  DCE     yes   0   0

Help is kindly requested to get a valid patch.

Bernard, 
f6bvp


