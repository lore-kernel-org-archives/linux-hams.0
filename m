From: =?iso-8859-1?q?=D8yvind=20Hanssen?= <oyvind@cs.uit.no>
Subject: INP3 patch + yam = kernel oops
Date: Wed, 2 Apr 2003 21:12:07 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200304022112.07835.oyvind@cs.uit.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I use 2.4.19 with Debian unstable and got it nicely up and running with
a Yam modem at 9k6. Then I tried the INP3 patch by pe1rqx, verson 004 
and the kernel goes down as soon as I try to do an actual call on the radio port. 
It also seems like something goes wrong as soon as I load YAM module
The kernel reports: segmentation fault,  at each call to ifconfig. The log 
shows (i removed the timestamps): 
----------------------------------------------------------
YAM driver version 0.8 by F1OAT/F6FBB
Unable to handle kernel NULL pointer dereference at virtual address 00000000
printing eip:
00000000
*pde = 00000000
Oops: 0000
CPU:    0
 EIP:    0010:[<00000000>]    Not tainted
 EFLAGS: 00010202
eax: d8859000   ebx: d19ad680   ecx: d19ac160   edx: c029aa88
esi: d19ac150   edi: d19ac040   ebp: d1b387a0   esp: d19bff40
ds: 0018   es: 0018   ss: 0018
Process ifconfig (pid: 813, stackpage=d19bf000)
Stack: d8855c01 d19ad680 00000000 00000002 00000000 d19ac150 c142f1e0 c01c933c 
   d19ac150 d19ac040 c01c9939 d19ac150 d2eea540 00000000 d2eea540 c0136ffc 
   d19ac040 d2eea540 d2eea540 d6f5cbc0 00000000 bffffb18 c013563d d2eea540 
Call Trace:    [<d8855c01>] [sock_set_timeout+60/160] [sock_getsockopt+73/816] [shmem_file_setup+76/352] [shmem_unuse_inode+93/320]
   [shmem_unuse_inode+222/320] [system_call+51/56]
 
 Code:  Bad EIP value.
------------------------------------------------------------

I was thinking of giving up and do without INP3, but if anyone knows this problem and 
perhaps a hint where to look?? I used the patch which was meant for a 2.4.19 prerelease, but
agains the official 2.4.19 kernel source. I cant find any other info on this than: 
http://sharon.pi8zaa.ampr.org/users/pe1rxq/inp3.html

Btw. What is the "sock_orphan patch"?

73 de LA7ECA


