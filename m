From: "Robin Gilks" <robin@gilks.org>
Subject: Re: 2nd indoor Packet Radio
Date: Fri, 18 Jul 2003 22:00:19 -0000 (GMT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <46229.192.168.1.1.1058565619.squirrel@server>
References: <20030712153628.GA7158@cloud.net.au>
        <20030718150452.24757.qmail@web14410.mail.yahoo.com>
Reply-To: robin@gilks.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030718150452.24757.qmail@web14410.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


> Hi all,
>
[snip]
> Now, I am trying using HT, but all commands (ping,ftp,
> ssh, telnet) don't work ;-(
> |pc1|--|sc1|--|ht1| <~~~~~> |ht2|--|sc2|--|pc2|
>

Hand helds are well known for having a really long keyup time - extend the
parameter called TXdelay to at 500mS (or maybe as much as 750mS) by
setting the value 50 (or 75) - the units are in 10mS intervals.

Next listen carefully to the transmit audio to see if it sounds really
loud or quiet - either would indicate that the deviation is incorrect.
Finally check the actual level to see how it compares to the direct
connection that works OK.

-- 
Robin Gilks
Internet: robin@gilks.org    http://www.gilks.org
Tel:      (+44) 1628 520585  Fax:  (+44) 8700 516573



