From: =?iso-8859-1?Q?Arnau_S=E1nchez?= <arnau@gbt.tfo.upm.es>
Subject: Re: ax25 with digipeaters
Date: Mon, 19 Jul 2004 14:01:09 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <00b301c46d88$14f8b540$050010ac@tokland>
References: <Pine.LNX.4.44.0407152121160.30845-100000@wapiti>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> Make sure the syntax is proper for your command.  I don't recall
> whether spaces are needed or commas between stations.
> 
> Yes, there are parameters on the intermediate stations that would
> need to be set to use it as a digipeater.  Something like "MRPT
> ON"???  Can't recall the exact commands, and they may change based
> on the TNC or the software involved.

Syntax is correct, as listen shows:

vhf: EAX25: fm ORIG to DEST via DIGI ctl SABME+ 07:00:58

but DIGI does not retransmit the packet.


> Something like "MRPT ON"??? 

I forgot to mention, I am not using a TNC but soundmodem.

any ideas?
arnau

