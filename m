From: "Dave Hibberd" <d@vehibberd.com>
Subject: Re: soundmodem bit rot prevention
Date: Mon, 29 Nov 2021 11:59:59 +0000
Message-ID: <09fdc26a-0db0-4545-b655-9e4c9d5f56a0@www.fastmail.com>
References: <208413a5-c061-2008-0760-f4d4ed55fcdb@blackspace.at>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vehibberd.com;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm1; bh=NR/y/tWZz8x8waskEWZnlj+BMHQxuQA
        4pkw6CSUUh/M=; b=C2JPSQFqQPg21KguAMN6lrrLhL7Ul6NXy72qURX/EOnCujR
        wyGR0vv70fyb3Ztp1oUcpg0d659Z0plNY8n4qqvMhPBJL0m4bOsgHYlBMZl8uN40
        90KYz78gLPvC5I+nfRHo8AFjcbg5h4eJ071rlrUqwEIa8cRV/Gye4EiEuMn4Gc8z
        kgsRxv5rPS/8lB90pwdc+dgi0pd5SQLWmgricagfyyRX9YP524kZjf23ZLceLRtl
        MaDeB9f+/pt3QDw8aM2ZBDGHVdQVM03IxPWYc8tCr55uWewoGQIhKGGwVn/E4HVP
        LNGqkNTwCpgzeWY9Rn4B8VUynMnXbmAidpEYTQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NR/y/t
        WZz8x8waskEWZnlj+BMHQxuQA4pkw6CSUUh/M=; b=IBnWR5R7qqCoXpGui9GsZk
        pCWl0HzbkT1zuIzqaIPqE/cCCOtljoBxcdLIrzJGhKBvDXLqVJf0tJN1GPIcZ2gf
        6R2YRnbJZ3XZglPv6wXtgR9LAPeJkG3SABuyTxYb6zLMIV0gvUdafi2aSyGRtpHt
        lY52vQpmOiVoXlxFZO+PGQk19WUf4aciMYHyuqUOba8HfXhVKM0LRJVt/i1vnnr1
        05QmMYz1nKA7zBHlXclR3r1CbKhvaBHfS6rO18xg4189mI/7eFT13Jrvx4scAvUQ
        AzeoGOVsHxrRdZwrB/Hco2O/Y3sdx1Sw8DHN36j1ZOYqfKdv+jRMTCbt2HXQxROQ
        ==
In-Reply-To: <208413a5-c061-2008-0760-f4d4ed55fcdb@blackspace.at>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hey there,

Great work, thanks for taking this on and thank you for caring!

I possibly can't test BLR as I'm not wholly sure what it is and what use it would be on my test rigs (FT-7900, FT-100D) - what's the benefit of the feature? 

I'm keeping track of this, when you get to GTK-3 relative stability, we can think about migrating the soundmodem debian package to the codebase :)

Cheers,

-- 
  Hibby
  MM0RFN

On Sun, 28 Nov 2021, at 5:22 PM, Roland Schwarz wrote:
> To all who care,
>
> I gave the soundmodem some love to save it from bit rot. I know the most 
> important problem is dependency on legacy gtk2. However, this is not 
> resolved yet. I am working on a solution.
>
> I have fixed the warnings and some issues which were found by clang 
> tidy. I also have added systemd support and started improving the docs
> by filling the README file with text.
>
> Most importantly (for me) is the addition of BLR (baseline restoration) 
> to the 9600Bd modem. This addition allowed me to use a Yaesu FTM-400XD 
> with 9600Bd which simply did not work without BLR at all. I expect other
> transceivers to benefit from this addition as well. I would be very 
> interested of your findings.
>
> The code is also on gitlab near Thomas Sailers repo:
>
> https://gitlab.com/packetradio/soundmodem
>
> vy 73 de Roland, oe1rsa
>
>
> -- 
> __________________________________________
>    _  _  | Roland Schwarz
>   |_)(_  |
>   | \__) | mailto:roland.schwarz@blackspace.at
> ________| http://www.blackspace.at
>
> Attachments:
> * OpenPGP_signature
