From: Bob Nielsen <nielsen@oz.net>
Subject: Re: callsign limit
Date: Wed, 31 May 2006 07:57:25 -0700
Message-ID: <068D0B6A-DBE7-4E94-9E3A-DA2FF45FC9A8@oz.net>
References: <1149077523.447d881344509@mgtmail.com> <20060531131500.GA16753@hugh.borg>
Mime-Version: 1.0 (Apple Message framework v750)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060531131500.GA16753@hugh.borg>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; delsp="yes	format=flowed"
To: linux-hams@vger.kernel.org


On May 31, 2006, at 6:15 AM, Robert Steinh=E4u=DFer wrote:

> Hi!
>
> We're no longer on a linux subject (linux-hams), but I suppose enough
> here are interested.
>
> On Wed, May 31, 2006 at 12:12:03PM +0000, IT3 Stuart Blake Tener =20
> wrote:
>> Though only Canada has started issuing 2x4's as far as I know.
>>
>> While special event stations (even for Packet) are able to get 2x1 =20
>> callsigns in
>> the United States.
>
> 2x1 in the US aren't only for special events, see KA9Q etc. But I
> haven't seen other countries issuing 2x1 or 1xN (e.g. N9KBK) in the
> past. That seems to have changed recently.

I think he meant 1X1 for special events.  Many countries have 1XN =20
callsigns (G, F, I, W, etc.)

>> Jordon also issued 1x1 calls too.
>
> Do you mean JY1 etc.? Using this terminology that would be a 2x0 ;-)
>
> These special calls are becoming quite common in many countries now,
> also here in Germany, from 2x1s for contest/clubstations (e.g. DR6A)
> to the short-time stations during the soccer World Cup with calls lik=
e
> DR2006N and DQ2006J (which would be "2x1" as well).
>
> Perhaps somebody could check which syntax is valid now? I don't know
> where to look. Was there any statement made on how calls longer than
> 6 chars are to be used on packet? Perhaps just use a different ID
> (which one?) and additionally set a beacon with the correct call in =20
> the
> data part? How do other modes (was it AMTOR?) handle this?

That is probably the best way (for now, at least).  Although I =20
haven't encountered it, I suspect that is the way it is handled by =20
stations operating from other than their home country (using =20
designators such as DL/W1AAA).

There may be a need for a change to AX.25. TAPR (as custodian of the =20
AX.25 specification) has a mailing list which is already discussing =20
this issue:

  <https://lists.tapr.org/cgi-bin/mailman/listinfo/ax25-layer2>.

73,
Bob, N7XY


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
