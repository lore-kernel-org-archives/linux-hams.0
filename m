From: Waldek <sp2ong@wp.pl>
Subject: Re: patch INP3 for kernel 3.6
Date: Thu, 26 Sep 2013 10:02:06 +0200
Message-ID: <5243e9fee1a652.62390282@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1380182527; bh=GvYXgNZHAK+9Xrt0bVUTYJIJ8FHNQzPOCrDk/FuUh50=;
          h=From:To:Subject;
          b=hEi/aWeoLp4gcL0k7WG/4X3241T0lLFe5JR0rz3F6qSiVQ1g1hiDvuXF2ISnQ941x
           q4zeYMKsZ+bnvp6y1gpQ/OgRzfBFb79EX7/z17v3qxF+IubF2LYcPAwUPBDvwtrjM/
           g3OFHAzMa8LRBT0J4tJlJtc89uxmaG+m4Oo1BpDw=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>


Hi Matt,
 
I have try use this patch in 3.6.11 kernel:
patching file include/linux/netrom.h
Hunk #1 succeeded at 18 (offset 2 lines).
patching file include/net/netrom.h
Hunk #1 FAILED at 9.
Hunk #2 succeeded at 38 (offset 1 line).
Hunk #3 succeeded at 67 (offset 1 line).
Hunk #4 succeeded at 106 (offset 1 line).
Hunk #5 succeeded at 127 (offset 1 line).
Hunk #6 succeeded at 231 (offset 1 line).
Hunk #7 succeeded at 296 (offset 1 line).
1 out of 7 hunks FAILED -- saving rejects to file include/net/netrom.h.rej
patching file net/ax25/Kconfig
patching file net/netrom/af_netrom.c
Hunk #2 succeeded at 1252 with fuzz 2 (offset -3 lines).
Hunk #3 succeeded at 1441 (offset -18 lines).
Hunk #4 succeeded at 1476 (offset -18 lines).
Hunk #5 succeeded at 1508 (offset -18 lines).
patching file net/netrom/inp3.c
patching file net/netrom/Makefile
patching file net/netrom/nr_route.c
Hunk #2 succeeded at 41 (offset 1 line).
Hunk #3 succeeded at 69 (offset 1 line).
Hunk #4 succeeded at 94 (offset 1 line).
Hunk #5 succeeded at 132 (offset 1 line).
Hunk #6 succeeded at 163 (offset 1 line).
Hunk #7 succeeded at 185 (offset 1 line).
Hunk #8 succeeded at 230 (offset 1 line).
Hunk #9 succeeded at 279 with fuzz 2 (offset 1 line).
Hunk #10 succeeded at 342 (offset 4 lines).
Hunk #11 succeeded at 370 (offset 4 lines).
Hunk #12 succeeded at 415 (offset 4 lines).
Hunk #13 succeeded at 456 (offset 4 lines).
Hunk #14 succeeded at 504 (offset 4 lines).
Hunk #15 succeeded at 549 (offset 4 lines).
Hunk #16 succeeded at 560 (offset 4 lines).
Hunk #17 succeeded at 579 (offset 4 lines).
Hunk #18 succeeded at 617 (offset 5 lines).
Hunk #19 succeeded at 690 (offset 5 lines).
Hunk #20 succeeded at 897 (offset 9 lines).
Hunk #21 succeeded at 912 (offset 9 lines).
Hunk #22 succeeded at 944 (offset 9 lines).
Hunk #23 succeeded at 954 (offset 9 lines).
Hunk #24 succeeded at 973 (offset 9 lines).
Hunk #25 succeeded at 1004 (offset 9 lines).
 
 
and display rejected netrom.h:
 
include/net$ more netrom.h.rej 
*** include/net/netrom.h2012-09-23 05:24:40.000000000 +1000
--- include/net/netrom.h2012-12-14 17:00:59.000000000 +1100
***************
*** 9,14 ****
  
  #include <linux/netrom.h>
  #include <linux/list.h>
  #include <net/sock.h>
  
  #defineNR_NETWORK_LEN15
--- 9,15 ----
  
  #include <linux/netrom.h>
  #include <linux/list.h>
+ #include <linux/types.h>
  #include <net/sock.h>
  
  #defineNR_NETWORK_LEN15
 



