From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Filter for 430Mhz
Date: Tue, 09 Aug 2005 22:25:36 +0100
Message-ID: <42F91F50.9090509@rns-stearn.demon.co.uk>
References: <200508092151.57245.stephen@g6dzj.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200508092151.57245.stephen@g6dzj.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>

Stephen Kitchener wrote:
> Hi, 
> 
> I have a problem with a really near 430Mz transmitter (my own) that is 
> breaking though to the TV. The Transmitter isn't off tune and as far as I 
> Know or can see, it isn't producing any side transmissions or birdies. 
> 
> So, My question is, does anyone know of a really good filter design or 
> commercial filer that will block 430.625 so that it dosn't appear in the 
> downlead to the TV.
> 
> Thanks

Try:
	http://www.ifwtech.co.uk/g3sek/swxfiltr/swxfiltr.htm

Bottom of the page:
	UHF TV Bandpass Filter (432MHz reject)

I use a 144MHz filter in the broadcast radio aerial and the 430MHz filter
in the TV downlead. Then combine both downleads into a distribution amp.

All the bits are fitted inside an old biscuit tin with clampon ferrites
as feed-throughs.

It is not perfect but does reduce the interference to an acceptable level,
i.e. the rest of the family does not notice it.

It is worth noting that digital TV is _much_ less tolerant of interference
than the analogue system.

-- 
73 de g1sog
	Richard
