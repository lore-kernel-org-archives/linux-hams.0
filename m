From: terry <wd0fpc@aniota.com>
Subject: Re: Regarding RedHat v7.2 and Echolink!
Date: Mon, 30 Dec 2002 14:24:18 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.50.0212301340580.3642-100000@yossarian.aniota.net>
References: <3E0FCED3.2000506@kj6eo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E0FCED3.2000506@kj6eo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>


... ciao:

> I am running my own domain ... and an internet connection to my LAN.
> "ETH0" is connected my ADSL router and "ETH1" to my HUB.

    i employ that same topology, however, i have no need for DHCP as all
my machines answer to entries in 'etc/hosts'.


> ipchains -A forward -s 192.168.1.0/24 -d 0/0 -j MASQ

   i'm running RH 6.2 with a kernel of 2.2.23, so do not have the 7.2
firewall stuff.  i use 'bastille' to provide that functionality.  it
specifies the following 'format' for the MASQ stuff.

	${IPCHAINS} -A forward -s ${net} -i ${pub} -j MASQ

here, the "-i ${pub}" is 'eth0' and 'ipchains --list' offers:

MASQ       all  ------  192.168.20.0/26      0.0.0.0/0             n/a


    hope that helps ...

-- 
73 , de WD0FPC
    aka: terry
