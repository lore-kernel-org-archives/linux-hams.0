From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: Re: ax25d and callsign*
Date: Sun, 28 Sep 2003 18:57:27 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F7712F7.2030000@pi8zaa.ampr.org>
References: <5.2.1.1.2.20030929001043.01b50860@joan.greenwood.wa.edu.au> <5.2.1.1.2.20030929001043.01b50860@joan.greenwood.wa.edu.au> <5.2.1.1.2.20030929004058.01b1fdf8@vk6hgr.echidna.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5.2.1.1.2.20030929004058.01b1fdf8@vk6hgr.echidna.id.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gavin Rogers <grogers@vk6hgr.echidna.id.au>
Cc: linux-hams@vger.kernel.org

Gavin Rogers wrote:

> At 06:32 PM 28/09/2003 +0200, you wrote:
>
>>> [VK6HGR-7* VIA loop]
>>> default * * * * * *  - root  /usr/sbin/rsuplnk rsuplnk  rose
>>>
>>
>> remove the asterisk. I.e [VK6HGR-7 VIA loop]
>
>
> Hi Arno.
>
> I tried that. Without the asterisk it sets up ax25d to listen for a 
> call directed _to_ that callsign, not via the callsign in a digipeater 
> call.
>
> Without the asterisk I can call vk6hgr-7 and rsuplnk runs (albeit with 
> an error, since that isn't how it's designed to be called):
>
> c loop vk6hgr-7
>
> Trying VK6HGR-7 on loop... Type <RETURN> to abort
> Connected to VK6HGR-12 (Escape: CTRL-T)
> *** No ROSE address given
> ^T
> Reconnected to HGRNOD:VK6HGR-15
>
>

Oops... I was too hastely answering and didn't read well enough through 
your question. I missed the part about the digipeater.
I have never used it that way. (didn't even know it was possible)

Are you limited to rose for some reason?
If netrom is also ok for you, then you could consider using pe1rxq's 
nrbridge.
http://sharon.esrac.ele.tue.nl/users/pe1rxq/


-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org


