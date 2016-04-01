From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [Linux-ham] netrom
Date: Fri, 1 Apr 2016 12:37:21 -0700
Message-ID: <56FECDF1.5090701@trinnet.net>
References: <20160401184009.GB25136@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160401184009.GB25136@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: folkert <folkert@vanheusden.com>, linux-hams@vger.kernel.org


Hello Folkert,

> /etc/ax25/nrports contains:
> nr0      FH2LOR-2        svnnah   235     netrom

Don't use a name like "nr0" as this device name will be used and shown 
in the output of "ifconfig -a".  In the nrports file, I recommend to 
name it say "netrom" or "netrom0".  Anything will do really.



> /etc/ax25/nrbroadcast contains:
> ax0	5	192	100	1

This is your problem.. this needs to point to the AX25 interface name 
and NOT the device name.  This will be something like "vhfdrop" or 
whatever as defined in your /etc/ax25/axports file.  Btw, unless your 
machine is going to be a high level netrom node, I don't recommend you 
send out Netrom beacons to have stations route traffic THROUGH you.  As 
such, change the last parameter (called verbose) to 0.


> and /etc/ax25/axports contains:
> ax0	FH2LOR-1	115200	254	1	AX.25 over LoRa

Don't use a name like "ax0" as this device name will be used and shown 
in the output of "ifconfig -a".  In the axports file, I recommend to 
name it say "vhfdrop" or "d710".  Anything will do really.

--David
KI6ZHD
