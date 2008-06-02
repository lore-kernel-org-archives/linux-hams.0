From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: BUGs into libax25
Date: Mon, 2 Jun 2008 13:41:49 +0300
Message-ID: <20080602104149.GS3700@mea-ext.zmailer.org>
References: <1K36Sn-0OkOu00@fwd26.aul.t-online.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1K36Sn-0OkOu00@fwd26.aul.t-online.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: DL5DI <dl5di@prgm.org>
Cc: linux-hams@vger.kernel.org

On Mon, Jun 02, 2008 at 11:36:25AM +0200, DL5DI wrote:
> This special event station callsign that we sometimes find like
> DQ2008ANYEVENT will never work in packet radio.
> The protocol header of ax25 frames only allows 6 bytes of callsign and 1
> halfbyte of SSID.
> Not only for the destiantion, also for all digipeaters inbetween.
> We would need to change the whole protocol and all digipeaters and stations
> using it worldwide to get that covered.
> I expect that packet radio will be dead before that happens. :-)

Arbitrary long callsigns...   Only OSI stack can handle that, and even it
has some upper limits on address lengths.

On IPv6 the addresses are 16 bytes long, and low 8 bytes (64 bits) of them
are reserved for "link local" use.    Considering that..  one can encode
any callsign with 38 characters, add couple codes for things like
"no character here", and "next is ssid", that would be 40 codes.
Using 6 bits per character one could encode 10 characters + 4 bits on IPv6-
address "local half".  With arithmetic encoding (see APRS mic-e) maybe
17 code bytes.

Would that be AX.25 ?  Definitely not.  That would be IPv6.

On IPv6 the basic assumption is that link local area is /64 size slice,
and thus "AX.25 space" would be something smaller..  like  /32.

How could we implement smooth transition from AX.25 to IPv6 on data links ?
Very good question...  old legacy junk will want to live a long time.
(we are way too willing to recycle obsolete hardware...)

> 73 de Hans, DL5DI

73 de Matti, OH2MQK
