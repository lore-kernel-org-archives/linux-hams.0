From: folkert <folkert@vanheusden.com>
Subject: Re: [Linux-ham] netrom
Date: Fri, 8 Apr 2016 11:44:00 +0200
Message-ID: <20160408094400.GS25136@belle.intranet.vanheusden.com>
References: <20160401184009.GB25136@belle.intranet.vanheusden.com>
 <56FECDF1.5090701@trinnet.net>
 <20160401201200.GE25136@belle.intranet.vanheusden.com>
 <56FEE62F.40003@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FEE62F.40003@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: linux-hams@vger.kernel.org

On Fri, Apr 01, 2016 at 02:20:47PM -0700, David Ranch wrote:
> >netrom      FH2LOR-2        svnnah   235     netrom
> /etc/ax25/nrports Looks ok.
> >axport0	5	192	100	0
> /etc/ax25/nrbroadcast looks ok but maybe try renaming this to say "axport".
> Maybe the trailing 0 is messing things up. Be sure to update the
> /etc/ax25/axports file with the same name too

Problem is that there are multiple ax25 ports. I'll replace it with an
'l' (for lora).

> >axport0	FH2LOR-1	115200	254	8	AX.25 over LoRa
> Looks ok though what is the RF link speed you're using?  I've seen some
> funny buffering problems in the past so I actually use 9600 baud to the TNC
> for a 1200baud RF link

The rf-link is lora and I think it is around 300bps. The speed to the
tnc is 115k2 because of overhead and practical reasons.

> >Unfortunately it still fails:
> >root@savannah:~# modprobe netrom
> >root@savannah:~# nrattach netrom
> >nrattach: cannot find free NET/ROM device
> 
> What do you have in /etc/ax25/nrbroadcast

axports: axportl FH2LOR-1        115200  254     8       AX.25 over LoRa
nrports: netrom      FH2LOR-2        svnnah   235     netrom
nrbroadcast: axportl 5       192     100     1

> Are you sure the netrom module is loaded? Check:
> $ lsmod | grep netrom
> netrom                 47709  2
> ax25                   65384  16 netrom,mkiss

root@savannah:/etc/ax25# lsmod  |grep netrom
netrom                 40573  0 
ax25                   60033  4 mkiss,netrom

root@savannah:/etc/ax25# nrattach -i 192.168.6.2 -m 236 netrom
nrattach: cannot find free NET/ROM device

> The way I load my system via my packetrig.sh startup script, I use:
> $NRATTACH -i $AMPRIP -m 236 $VHFD710NRPORT
> I would also recommend you to show each of the commands you're using to load
> up your stack:
>    - Are you using the mkiss approach with PTYs or using kissattach
> directly?

Kissattach directly:

/usr/sbin/kissattach -l /dev/ttyUSB0 axport0 192.168.5.2
sleep 5
/usr/sbin/ax25d -l
/usr/sbin/beacon -t 1 -l axport0 'AX.25 over LoRa - contact mail@vanheusden.com for info'
/sbin/modprobe netrom
/usr/sbin/nrattach -i 192.168.6.2 -m 236 netrom
/usr/sbin/netromd -i -l -t 20
/usr/bin/nohup /usr/bin/axlisten -a -r -8 -t >> /home/folkert/ax25-lora.log &
/usr/sbin/mheardd -l -n 1000

>    - Are you seeing any errors when you run each command?

Something odd happened: now it suddenly works!
What I did different is axportl instead of axport0.
But on the other system axport0 runs fine? Puzzling.


Folkert van Heusden

-- 
Nagios user? Check out CoffeeSaint - the versatile Nagios status
viewer! http://www.vanheusden.com/java/CoffeeSaint/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
