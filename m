From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [Linux-ham] netrom
Date: Fri, 1 Apr 2016 14:20:47 -0700
Message-ID: <56FEE62F.40003@trinnet.net>
References: <20160401184009.GB25136@belle.intranet.vanheusden.com>
 <56FECDF1.5090701@trinnet.net>
 <20160401201200.GE25136@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160401201200.GE25136@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: folkert <folkert@vanheusden.com>
Cc: linux-hams@vger.kernel.org


Hello Folkert,



> Ah I thought it was actually the network-devicename that you needed to
> put in there!

Yeah... I agree this is NOT obvious nor intuitive


> netrom      FH2LOR-2        svnnah   235     netrom

/etc/ax25/nrports Looks ok.


> axport0	5	192	100	0

/etc/ax25/nrbroadcast looks ok but maybe try renaming this to say 
"axport".  Maybe the trailing 0 is messing things up. Be sure to update 
the /etc/ax25/axports file with the same name too


> axport0	FH2LOR-1	115200	254	8	AX.25 over LoRa

Looks ok though what is the RF link speed you're using?  I've seen some 
funny buffering problems in the past so I actually use 9600 baud to the 
TNC for a 1200baud RF link


> Unfortunately it still fails:
>
> root@savannah:~# modprobe netrom
> root@savannah:~# nrattach netrom
> nrattach: cannot find free NET/ROM device

What do you have in /etc/ax25/nrbroadcast



Are you sure the netrom module is loaded? Check:

$ lsmod | grep netrom
netrom                 47709  2
ax25                   65384  16 netrom,mkiss


The way I load my system via my packetrig.sh startup script, I use:

$NRATTACH -i $AMPRIP -m 236 $VHFD710NRPORT


I would also recommend you to show each of the commands you're using to 
load up your stack:

    - Are you using the mkiss approach with PTYs or using kissattach 
directly?

    - Are you seeing any errors when you run each command?


See

http://www.trinityos.com/HAM/CentosDigitalModes/usr/local/sbin/packetrig.sh

for the script but it is a pretty complex script for new Linux users.

--David
KI6ZHD
