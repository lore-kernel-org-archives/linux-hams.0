From: "Robin Gilks" <robin@gilks.org>
Subject: Re: Packet at the physical level
Date: Fri, 19 Sep 2003 10:37:40 +1200 (NZST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <53174.202.37.96.11.1063924660.squirrel@server>
References: <20030918190546.GB3466@n7xy.net>
        <memo.20030918184842.4613A@rovoreed.compulink.co.uk>
        <E1A04H7-0008Ka-00@yagi.h-net.msu.edu>
Reply-To: robin@gilks.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <E1A04H7-0008Ka-00@yagi.h-net.msu.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Greetings

To get a view of the physical layer just above the tones themselves, take
a look at the bit-bashing in the TVIPUG (Thames Valley IP User Group) 9k6
modem. This does all the NRZ/NRZI conversion, the CRC generation and
checking, the bit stuffing and stripping on a bit level (makes it a bit
clearer than byte level I think!!). Its also independent of the speed and
avoids the pitfall of thinking all packet being at 1200bps :-))

http://www.tvipug.org/download/ipri-1.00.tar.gz


> I'm trying to find out what happens at the physical level with
> Ax25 packet. I've tried looking at the source code but either I'm
> looking  in the wrong place, or I don't understand.
>


-- 
Robin Gilks
Internet: robin@gilks.org    http://www.gilks.org
Tel:      (+64) (3) 357 9383



