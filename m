From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: BUGs into libax25
Date: Mon, 02 Jun 2008 18:28:41 +0200
Message-ID: <48441FB9.6000405@ccr.jussieu.fr>
References: <1K36Sn-0OkOu00@fwd26.aul.t-online.de> <20080602104149.GS3700@mea-ext.zmailer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20080602104149.GS3700@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Matti Aarnio <matti.aarnio@zmailer.org>
Cc: DL5DI <dl5di@prgm.org>, linux-hams@vger.kernel.org

Hi,

Sorry, I wrongly wrote 6 letters callsigns where I wanted to say 6=20
characters. Not the same of course.
My typo leaded to an interesting discussion.
Somedays I dreamt that we could increase the SSID number up to 31.
But the necessary bytes are already taken by DAMA protocol and EAX25 fl=
ags.

Back to the bug.
With previous loop limit (<6) into the code, a callsign like KD4YAL-8=20
would not be correctly translated into shifted ASCII AX25 code.
Actually, with this 6 characters callsign, SSID was truncated and an=20
error message sent complaining about SSID not being correctly entered.
I had seen it very often in FPAC. I am glad I found the error while=20
investigating on other bugs.

73 de Bernard, f6bvp

Matti Aarnio a =E9crit :
> On Mon, Jun 02, 2008 at 11:36:25AM +0200, DL5DI wrote:
>  =20
>> This special event station callsign that we sometimes find like
>> DQ2008ANYEVENT will never work in packet radio.
>> The protocol header of ax25 frames only allows 6 bytes of callsign a=
nd 1
>> halfbyte of SSID.
>> Not only for the destiantion, also for all digipeaters inbetween.
>> We would need to change the whole protocol and all digipeaters and s=
tations
>> using it worldwide to get that covered.
>> I expect that packet radio will be dead before that happens. :-)
>>    =20
>
> Arbitrary long callsigns...   Only OSI stack can handle that, and eve=
n it
> has some upper limits on address lengths.
>
> On IPv6 the addresses are 16 bytes long, and low 8 bytes (64 bits) of=
 them
> are reserved for "link local" use.    Considering that..  one can enc=
ode
> any callsign with 38 characters, add couple codes for things like
> "no character here", and "next is ssid", that would be 40 codes.
> Using 6 bits per character one could encode 10 characters + 4 bits on=
 IPv6-
> address "local half".  With arithmetic encoding (see APRS mic-e) mayb=
e
> 17 code bytes.
>
> Would that be AX.25 ?  Definitely not.  That would be IPv6.
>
> On IPv6 the basic assumption is that link local area is /64 size slic=
e,
> and thus "AX.25 space" would be something smaller..  like  /32.
>
> How could we implement smooth transition from AX.25 to IPv6 on data l=
inks ?
> Very good question...  old legacy junk will want to live a long time.
> (we are way too willing to recycle obsolete hardware...)
>
>  =20
>> 73 de Hans, DL5DI
>>    =20
>
> 73 de Matti, OH2MQK
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  =20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
