From: "J. Lance Cotton" <joe@lightningflash.net>
Subject: Re: Soundmodem and sampling rate: force a rate?
Date: Wed, 26 Oct 2005 18:32:48 -0500
Message-ID: <43601220.6030901@lightningflash.net>
References: <435E3FAC.2080501@lightningflash.net> <435F1848.9060201@onr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <435F1848.9060201@onr.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: driven@onr.com
Cc: linux-hams@vger.kernel.org

David Rivenburg wrote:
> Even though the sample rate is set to 5000 there is a selection routine 
> in audioio.c that steps it up to 9600.  I tried editing the valid sample 
> rate list there but it still used 9600.
> 
> After making the above changes I have not had any trouble at all with 
> soundmodem.  Not that there aren't any, but I don't know of another way 
> to force a sample rate.

Thanks for the hints. This does force a higher, valid sample rate. 
However, it doesn't seem to improve the operation of soundmodem on a SB 
Live card.

I've since found a different soundcard that works perfectly (with or 
without this modification), so problem solved one way or another.

KJ5O
-- 
J. Lance Cotton, KJ5O
joe@lightningflash.net
http://kj5o.lightningflash.net
Three Step Plan: 1. Take over the world. 2. Get a lot of cookies. 3. Eat 
the cookies.
