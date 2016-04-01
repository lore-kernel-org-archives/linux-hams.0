From: folkert <folkert@vanheusden.com>
Subject: icmp
Date: Fri, 1 Apr 2016 20:42:26 +0200
Message-ID: <20160401184226.GC25136@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

This evening I succeeded in doing ICMP over AX.25 over LoRa(!)!

root@savannah:~/data/mkiss_moteino# ping -i 5 192.168.5.1
PING 192.168.5.1 (192.168.5.1) 56(84) bytes of data.
64 bytes from 192.168.5.1: icmp_seq=4 ttl=64 time=4524 ms
64 bytes from 192.168.5.1: icmp_seq=7 ttl=64 time=1601 ms
64 bytes from 192.168.5.1: icmp_seq=8 ttl=64 time=1601 ms
64 bytes from 192.168.5.1: icmp_seq=9 ttl=64 time=1601 ms
^C
--- 192.168.5.1 ping statistics ---
9 packets transmitted, 4 received, 55% packet loss, time 40005ms
rtt min/avg/max/mdev = 1601.358/2332.248/4524.246/1265.550 ms


Strange thing is that I need to add a -i something to ping; the regular
1 second ping confuses things (-i 2 also works).

Software used: https://github.com/flok99/arduino-kiss


Folkert van Heusden

-- 
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
