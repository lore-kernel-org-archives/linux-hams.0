From: Bernard Pidoux F6BVP <f6bvp@free.fr>
Subject: [BUG] [AX25] in libax25
Date: Tue, 12 Feb 2008 11:40:27 +0100
Message-ID: <47B1779B.3000600@free.fr>
References: <47093A4E.5040409@hamradio.hr> <20071008082900.GB24782@cloud.net.au> <470A1035.5070900@hamradio.hr> <20071008134447.GA30451@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20071008134447.GA30451@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi,

I found a bug in libax25./proc/net/rose_neigh "use" field not read by
read_proc_rs_neigh and was missing in struct declaration.

For ROSE FPAC application development with 2.6 kernel I needed to check 
'restart' in rose_neigh and found that it was not correctly read by the 
library.I was getting 'mode' state instead of 'restart. This was because
'use' field was not taken into account. Of course, t0 and tf timers were
also no read correctly.

Here is an extract of ChangeLog file.

libax25 0.0.11.4
         * BUG in procutils.h and procutils.c
           in structure proc_rs_neigh field "use" was missing,
           in function read_proc_rs_neigh proc_rs_neigh use was not read,
           corrected.

Patched libax25 package can be downloaded from here :

http://f6bvp.free.fr/logiciels/ax25/libax25-0.0.11.4src_f6bvp.tgz

After compiling new libraries, AX25 applications must be re-compiled too 
and restarted in order to take into account the newly built libax25.


73 de Bernard, f6bvp
