From: f6bvp <f6bvp@free.fr>
Subject: Re: Fwd: Re: Interesting Rose patch
Date: Tue, 16 May 2017 20:27:36 +0200
Message-ID: <c5620b7c-d5d8-325e-2efe-77779e452f63@free.fr>
References: <309904235.63498.1492029796017@ox-groupware.bfs.de>
 <8dc528da-6d60-0fc4-4d6f-fa78b1f4ba86@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <8dc528da-6d60-0fc4-4d6f-fa78b1f4ba86@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org
Cc: =?UTF-8?Q?Ralf_B=c3=a4chle_DL5RB?= <ralf@linux-mips.org>, Richard Stearn <richard@rns-stearn.co.uk>, Basil Gunn <basil@pacabunga.com>

Hi David,

I applied the following Walter's modification to Richard's patch with 
success to both kernels 4.10 and 4.11.

diff -ruN a/net/rose/rose_route.c a/net/rose/rose_route.c
--- a/net/rose/rose_route.c     2016-04-04 00:26:26.000000000 +0200
+++ b/net/rose/rose_route.c     2017-02-26 23:46:10.468772036 +0100
@@ -867,6 +866,11 @@
         int res = 0;
         char buf[11];

+       if (ax25 == NULL) {
+               printk(KERN_ERR "rose_route_frame : called with ax25 
callback == NULL\n");
+               return res;
+       }
+
         if (skb->len < ROSE_MIN_LEN)
                 return res;

Sending connect request ROSE/AX.25 frames through an IP device without 
routing gateway originated a NULL ax25 condition

that have been extensively explained in previous messages.

I used netconsole on local and remote machines to capture kernel message 
after applying the patch.

Here are /var/log/dmesg content

[    0.000000] Linux version 4.10.0 (root@f6bvp-6) (gcc version 4.9.2 
(GCC) ) #1 SMP Mon Feb 20 15:44:42 CET 2017
[    0.000000] Command line: BOOT_IMAGE=4.10.0 
root=UUID=f3cbe7d7-7b6d-4618-bc72-a044a0b20958 splash quiet noiswmd 
resume=UUID=cd3d43f3-1c51-46a1-8d40-6c693d50b0d4 vga=788
--------------
[   17.718171] NET: Registered protocol family 17
[  103.173995] console [netcon0] enabled
[  103.174040] netconsole: network logging started
[  103.180494] netconsole: network logging has already stopped
[  103.192495] printk: continuation disabled due to ext consoles, expect 
more fragments in /dev/kmsg
[  103.192527] console [netcon_ext0] enabled
[  103.192534] netpoll: netconsole: local port 6665
[  103.192543] netpoll: netconsole: local IPv4 address 192.168.0.119
[  103.192550] netpoll: netconsole: interface 'enp0s9'
[  103.192558] netpoll: netconsole: remote port 6666
[  103.192565] netpoll: netconsole: remote IPv4 address 192.168.0.115
[  103.192573] netpoll: netconsole: remote ethernet address 
b8:27:eb:9b:43:e5
[  103.192610] netconsole: netconsole: network logging started
[  103.270048] NET: Registered protocol family 3
[  103.273377] mkiss: AX.25 Multikiss, Hans Albas PE1AYX
[  103.274250] mkiss: ax0: crc mode is auto.
[  103.275388] IPv6: ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
[  103.361158] NET: Registered protocol family 11
[  106.376322] mkiss: ax0: Trying crc-smack
[  106.376876] mkiss: ax0: Trying crc-flexnet
[  237.193538] IPv4: martian source 255.255.255.255 from 44.168.19.17, 
on dev enp0s9
[  237.195491] ll header: 00000000: ff ff ff ff ff ff 00 0c 42 91 13 ac 
08 00        ........B.....
[  263.136213] rose_route_frame : called with ax25 callback == NULL
[  263.138758] rose_route_frame : called with ax25 callback == NULL
[  263.149080] rose_route_frame : called with ax25 callback == NULL
[  297.195431] IPv4: martian source 255.255.255.255 from 44.168.19.17, 
on dev enp0s9
[  297.195512] ll header: 00000000: ff ff ff ff ff ff 00 0c 42 91 13 ac 
08 00        ........B.....
[  324.576251] rose_route_frame : called with ax25 callback == NULL
[  324.576380] rose_route_frame : called with ax25 callback == NULL
[  324.576827] rose_route_frame : called with ax25 callback == NULL
[  357.205313] IPv4: martian source 255.255.255.255 from 44.168.19.17, 
on dev enp0s9
[  357.205391] ll header: 00000000: ff ff ff ff ff ff 00 0c 42 91 13 ac 
08 00        ........B.....
[  398.304379] rose_route_frame : called with ax25 callback == NULL
[  398.304520] rose_route_frame : called with ax25 callback == NULL
[  398.304874] rose_route_frame : called with ax25 callback == NULL
[  417.211572] IPv4: martian source 255.255.255.255 from 44.168.19.17, 
on dev enp0s9
[  417.213627] ll header: 00000000: ff ff ff ff ff ff 00 0c 42 91 13 ac 
08 00        ........B.....
---------------

This is remote console capture with nc :

3,822,623584407,-;rose_route_frame : called with ax25 callback == NULL
3,823,623586390,-;rose_route_frame : called with ax25 callback == NULL
3,824,623588128,-;rose_route_frame : called with ax25 callback == NULL
4,825,673724925,-;IPv4: martian source 255.255.255.255 from 
44.168.19.17, on dev enp0s9
4,826,673726146,-;ll header: 00000000: ff ff ff ff ff ff 00 0c 42 91 13 
ac 08 00        ........B.....
4,827,684896180,-;IPv4: martian source 44.168.19.20 from 44.168.19.17, 
on dev enp0s9
4,828,684897494,-;ll header: 00000000: ff ff ff ff ff ff 00 0c 42 91 13 
ac 08 06        ........B.....
4,829,685890394,-;IPv4: martian source 44.168.19.20 from 44.168.19.17, 
on dev enp0s9
4,830,685891811,-;ll header: 00000000: ff ff ff ff ff ff 00 0c 42 91 13 
ac 08 06        ........B.....
4,831,686890384,-;IPv4: martian source 44.168.19.20 from 44.168.19.17, 
on dev enp0s9
4,832,686891872,-;ll header: 00000000: ff ff ff ff ff ff 00 0c 42 91 13 
ac 08 06        ........B.....
3,833,697313405,-;rose_route_frame : called with ax25 callback == NULL
3,834,697315376,-;rose_route_frame : called with ax25 callback == NULL
3,835,697318136,-;rose_route_frame : called with ax25 callback == NULL

Above listing show that the patch is doing the job identifying the NULL 
condition and avoiding a kernel panic.


Bernard


Le 18/04/2017 à 18:14, David Ranch a écrit :
>
> Hey Bernard,
>
> Do you want to consider testing with Walter's modification to 
> Richard's patch mentioned on April 12th (below)?
>
> --David
>
>

