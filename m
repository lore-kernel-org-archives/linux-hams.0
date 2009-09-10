From: "J. Lance Cotton" <joe@lightningflash.net>
Subject: Re: Problem with soundmodem on Eee PC
Date: Wed, 09 Sep 2009 20:33:11 -0500
Message-ID: <4AA85757.8010105@lightningflash.net>
References: <984e45570909091532n34cb261hd9cdd6f30d448bf7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <984e45570909091532n34cb261hd9cdd6f30d448bf7@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Julian Moss <julian.g4ilo@gmail.com>
Cc: linux-hams@vger.kernel.org

On 09/09/2009 05:32 PM, Julian Moss wrote:
> I found a posting in a list here
> http://osdir.com/ml/linux.hams/2005-10/msg00058.html which suggested
> that this is caused by soundmodem opening the sound card at an
> unsupported sample rate of 9600. The post included a hack to make it
> use 11025.

I was the one who posted that original problem. My solutions were:

1) Use a different soundcard that supported the requested sample rate.

2) Use the ALSA sound system instead of the OSS system, which I think is 
now standard on Ubuntu and most other 2.6 Linuxes. I had been sticking 
with OSS for a while because I found the commercial (paid) OSS system to 
be very stable on the old SuSE distro I was running. I now use Ubuntu 
and the ALSA system will re-sample whatever audio comes in from whatever 
soundcard to give the software what it asked for.

Works well.

-Lance

-- 
J. Lance Cotton, KJ5O
joe@lightningflash.net
http://kj5o.lightningflash.net
Three Step Plan: 1. Take over the world. 2. Get a lot of cookies. 3. Eat 
the cookies.
