From: rovoreed@cix.co.uk (Mike Davies)
Subject: Re: Packet at the physical level
Date: Fri, 19 Sep 2003 07:10 +0000 (Greenwich Standard Time)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <memo.20030919071047.57493A@rovoreed.compulink.co.uk>
References: <E1A04H7-0008Ka-00@yagi.h-net.msu.edu>
Reply-To: rovoreed@cix.co.uk
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <E1A04H7-0008Ka-00@yagi.h-net.msu.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: rovoreed@cix.co.uk

	Thanks for all the replies (so far). A little bit of fiddling here 
has confirmed that valid packets can start with either tone. You learn 
something every day.

	By the way, VHF amateur packet is not Bell202 compatible. I've 
seen this mentioned before, but I've got the source code for a Bell202 
modem which I know works, and that simply uses a 1300Hz tone for high bit 
and a 2100Hz tone for a low bit. So not only does it use different tones 
it doesn't do the NRZ modulation.

	Hopefully in the next day or two I'll be able to transmit a few 
test packets, and then I'll be able to determine the CRC polynomial if 
nothing turns up before.

Mike
