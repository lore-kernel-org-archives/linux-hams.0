From: "Malcolm Davies" <malc.davies@tesco.net>
Subject: RE: Very quick Ptt
Date: Wed, 23 Jun 2004 00:05:03 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <MKEMIADGOFJHLPNBFLBACECMDBAA.malc.davies@tesco.net>
References: <40D86FEF.3000800@febo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40D86FEF.3000800@febo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Francisco <fco2010@ca.cc.cu>
Cc: linux-hams@vger.kernel.org


Hi

Have you checked the audio level into the tx - if too high on some rigs=
 this
can shut down the tx early
It happens on my FT-8000

bets 73's

Malcolm G8JTL

-----Original Message-----
=46rom: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org]On Behalf Of John R. Ackermann
N8UR
Sent: Tuesday, June 22, 2004 6:44 PM
To: Francisco
Cc: chuck@gelm.net; linux-hams@vger.kernel.org
Subject: Re: Very quick Ptt


HI Fransisco --

There is a "TXTail" parameter that keeps the PTT down for a specified
period after the end of data; this is necessary if there is some delay
(eg, a scrambler) through the modem.  So, you might try setting the
TXTail parameter to 10 or 20ms to see if that solves the problem.

73,
John N8UR
----

=46rancisco wrote:

> Hi
> The packet cut  at the end
> always happen
> "In MS-DOS and Windows I prove with BPQ and other Soft and it doesn't
happen
> "
>
> ----- Original Message -----
> From: "chuck gelm" <chuck@gelm.net>
> To: "Francisco" <fco2010@ca.cc.cu>
> Cc: <linux-hams@vger.kernel.org>
> Sent: Tuesday, June 22, 2004 11:00 AM
> Subject: Re: Very quick Ptt
>
>
>
>>Francisco wrote:
>>
>>>Cordial greetings,
>>>
>>>I have a problem with the TNC and the MODEM, when you tx the packet =
cut
>>>themselves or they don't give time completely to tx I have proven to
>>>increase the txtail but it continues happening .
>>>
>>>
>>>-
>>>To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>>>the body of a message to majordomo@vger.kernel.org
>>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>
>>Dear Francisco:
>>Which TNC and which MODEM?
>>Chuck nc8q
>>
>> >Hi
>> >Cordial greetings, and thank you to respond my query,
>> >I have a pk232 in way KISS, and the MODEM is M=D3DEM BAYCOM
>>
>>Is packet cut at the beginning or at the end?
>>What if Frames =3D 1,2,3,4,5,6,7 ?
>>If FRAME=3D7 is packet cut at frame 7 or frame 1 ?
>>Is SABM (control frames) and DIGIPEAT (& with multiple relays)
>>   frames cut?
>>Does it always happen or sometimes?
>>When does it always happen? SABM, POLL, DATA, DIGIPEAT, CONNECTED ?
>>When does it never happen?   "
>>
>>Chuck nc8q
>>p.s. Please, for me, always reply to the list.
>>
>>-
>>To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.708 / Virus Database: 464 - Release Date: 6/18/2004

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.708 / Virus Database: 464 - Release Date: 6/18/2004

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
