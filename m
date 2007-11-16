From: "J. Lance Cotton" <joe@lightningflash.net>
Subject: Re: Soundmodem - suppresing initial xmit
Date: Fri, 16 Nov 2007 11:04:39 -0600
Message-ID: <473DCDA7.8010101@lightningflash.net>
References: <20071116163231.GA9559@reid1.localdomain> <Pine.SUN.4.58.0711160846190.29303@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0711160846190.29303@eskimo.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Curt Mills, WE7U" <archer@eskimo.com>
Cc: don <don_reid@comcast.net>, linux-hams@vger.kernel.org

on 11/16/2007 10:48 AM Curt, WE7U said the following:
> On Fri, 16 Nov 2007, don wrote:
> 
>> When I start soundmodem, it sends out several transmissions.
>> They are addressed to "QST-0" and identify my workstation.
>>
>> Is there a simple way to suppres these?  They are fairly long
>> and sometimes I just want to listen to packets (like on an APRS freq).
> 
> Just a guess (and I'm probably totally wrong on this), but do you
> have Samba configured on that machine?
> 
> I remember some people ended up with SMB broadcasts going out on
> that interface.  The fix was to tweak the Samba configuration so
> that it didn't use that networking interface.  By default Samba
> broadcasts on all interfaces as I recall.

That's right. Also, on many newer distributions, I've also found that the 
mDNS service (the generic name for Apple's "Bonjour" auto-discovery 
protocol) broadcasts on all interfaces, too.

-Lance KJ5O

-- 
J. Lance Cotton, KJ5O
joe@lightningflash.net
http://kj5o.lightningflash.net
Three Step Plan: 1. Take over the world. 2. Get a lot of cookies. 3. Eat the 
cookies.

