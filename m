From: Andrea Borgia <borgia@cs.unibo.it>
Subject: Oops in 2.4.26 on ax25 connect?
Date: Sat, 17 Apr 2004 23:02:03 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40819B4B.40708@cs.unibo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hello.

On my Debian "Woody" system I am using the userspace soundmodem v0.7-1. 
I have setup ax25d to call ttylinkd when somebody connects to my own 
call and it was working fine with 2.4.25.

With 2.4.26, when my soundmodem attempts to reply to the incoming SABM 
packet, the kernel goes "oops": the affected process is ksoftirqd_cpu0 
and the error is "unable to handle virtual paging request at fffffffc" 
(quoting from memory, if anybody needs more detail just ask).

I have no clue as to what the problem is, but I can reproduce it at will 
with .26 and so far I have not managed to trigger it on .25 (the two 
kernels have identical settings and were built with gcc-3.2)

Has anyone else found the same problem? Any idea as to the cause?

B73,
Andrea.

-- 
Homepage: http://andrea.borgia.bo.it     /    Amateur radio: IZ4FHT
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

