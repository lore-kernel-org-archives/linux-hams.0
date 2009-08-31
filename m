From: Alan Crosswell <alan@columbia.edu>
Subject: Re: soundmodem and fsk 9600 baud
Date: Mon, 31 Aug 2009 09:07:04 -0400
Message-ID: <B55F78B2-A695-4EAE-BE74-7E9FCE2D34E6@columbia.edu>
References: <S1753962AbZH3VbK/20090830213110Z+828@vger.kernel.org> <4A9B36FC.4090409@trinnet.net>
Mime-Version: 1.0 (iPhone Mail 7A400)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4A9B36FC.4090409@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: David Ranch <linux-hams@trinnet.net>
Cc: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

David,

Are you connecting to the TH-F6A through the mic connector or the data  
connector?  AFSK 1200 works fine through either.  FSK 9600 needs to  
take the RX audio off the discriminator and TX has to bypass the Mic  
ckt which has some frequency rolloff.

I assume this HT has a data connector based on what I can see on the  
Kenwood web site....

See http://www.brazoriacountyares.org/winlink-collection/AGW/PE%20Pro/pehelp/6sc9600.htm 
  for a good description of requirements for FSK 9600 operation.

Soundmodemconfig's scope frequently dies for me too, but the modem  
works great. I've had my aprsdigi code running with soundmodem (at  
1200) for years at a time -- usually limited by power hits.

73 de N2YGK


On Aug 30, 2009, at 10:35 PM, David Ranch <linux-hams@trinnet.net>  
wrote:

> Hello Everyone,
>
> I'm new to the list and I'm curious if many people have had much luck
> with Tom Sailer's excellent Linux soundmodem 0.14 found in the URL  
> below:
>
>   http://www.baycom.org/~tom/ham/soundmodem/
>
>
> This is using:
>  - Centos 5.3 (modified kernel) and full up to date AX25 stack
>  - Dell Insperion 600 with a intel8x0 based AC97 soundcard
>
> All of this is working well for me at afsk:1200 with a Kenwood TH-F6A.
> The F6A has a 9600 TNC mode but I haven't had any luck at 9600.  I
> imagine much of my problems are due to volume levels but I'm not even
> getting decodes.
>
> Thoughts?
>
>
> Ps.  I was also curious if other people notice that when running
> soundmodemconfig in "scope" mode, the display works for say 3-8  
> seconds
> and then hangs up.  I can eventually close the window but it won't  
> work
> again until I restart soundmodemconfig.
>
> --David
> --
> To unsubscribe from this list: send the line "unsubscribe linux- 
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
