From: folkert <folkert@vanheusden.com>
Subject: [Linux-ham] netrom
Date: Fri, 1 Apr 2016 20:40:09 +0200
Message-ID: <20160401184009.GB25136@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

I'm trying to get netrom working.
Somehow it always fails:

root@savannah:~# modprobe netrom
root@savannah:~# nrattach nr0
nrattach: cannot find free NET/ROM device

Before that, no nrattach was running and also the netrom module was not
loaded.

/etc/ax25/nrports contains:
nr0      FH2LOR-2        svnnah   235     netrom

/etc/ax25/nrbroadcast contains:
ax0	5	192	100	1

and /etc/ax25/axports contains:
ax0	FH2LOR-1	115200	254	1	AX.25 over LoRa

dmesg says:
[ 8780.389979] NET: Registered protocol family 6

ifconfig of ax0:
root@savannah:~# ifconfig ax0
ax0       Link encap:AMPR AX.25  HWaddr FH2LOR-1  
          inet addr:192.168.5.2  Bcast:192.168.5.255  Mask:255.255.255.0
          UP BROADCAST RUNNING  MTU:254  Metric:1
          RX packets:925 errors:0 dropped:0 overruns:0 frame:0
          TX packets:343 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:36408 (35.5 KiB)  TX bytes:22806 (22.2 KiB)

after the netrom module was loaded I get 4 'nrx' devices:
nr0       Link encap:AMPR NET/ROM  HWaddr   
          UP RUNNING NOARP  MTU:236  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
... upto nr3

any ideas?


Folkert van Heusden

-- 
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
