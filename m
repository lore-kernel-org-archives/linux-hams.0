From: =?ISO-8859-1?Q?Joni_B=E4cklund?= <joni@connect.fi>
Subject: Re: 2.6.13 mkiss update?
Date: Thu, 05 Jan 2006 16:34:29 +0200
Message-ID: <43BD2E75.30406@connect.fi>
References: <003301c6114b$180ecb80$680ea8c0@LoJackOne.LoJack.com> <8BD9A378-7AF9-41DB-BE04-1EAD876ECB5D@oz.net> <001901c61202$d3f79310$680ea8c0@LoJackOne.LoJack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001901c61202$d3f79310$680ea8c0@LoJackOne.LoJack.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LinuxHams <linux-hams@vger.kernel.org>

I can confirm that running kissattach produces kernel panic with 2.6.15=
=2E=20
So do not use it until there is a patch available ! Seems that kernel=20
ax25 developers are not quite sync with the kernel network code..

I have 2.6.14.5 running quite fine, tested both with kiss and 6pack.=20
Also 2.6.13.X seriers runs fine with
6pack TNC driver that is way better than kiss anyhow :)

Joni

Mike McCarthy, W1NR wrote:
> I was successful in building 2.6.14-5 from source via kernel.org and=20
> loading and configuring ax25 on my 10.0 test system.  I have not yet=20
> connected a TNC and radio yet.  That will come next.  At least the=20
> modules load and kissattach works.
>=20
> There are too many changes to easily back patch the sources to the=20
> 2.6.13 kernel.  The SuSE kotd 2.6.15 build from January 2 hard locks =
the=20
> system when doing kissattach.  I hope that isn't a bad sign for futur=
e=20
> releases.
>=20
> Once OpenSuSE 10.1 beta is available, I'll try loading that.  My=20
> production servers will stay at 9.3 until 10.1 gets officially releas=
ed=20
> and I have tested it thoroughly.
>=20
> Mike, W1NR
>=20
> ----- Original Message ----- From: "Bob Nielsen" <nielsen@oz.net>
> To: "Mike McCarthy, W1NR" <lists@w1nr.net>
> Cc: <linux-hams@vger.kernel.org>
> Sent: Wednesday, January 04, 2006 12:03 PM
> Subject: Re: 2.6.13 mkiss update?
>=20
>=20
>> I thought it was the ax25 module that was broken.  In any case, =20
>> 2.6.14 (and presumably 2.6.15) works, so you could try one of them. =
 =20
>> If there is some other reason why you need 2.6.13, download a later =
=20
>> kernel and try replacing ax25.c and mkiss.c with the later versions =
=20
>> and recompiling the kernel (this may or may not work, depending on =20
>> other changes).  You can get the source from ftp.kernel.org in the /=
=20
>> pub/linux/kernel/v2.6 directory.
>>
>> Bob, N7XY
>> On Jan 4, 2006, at 8:22 AM, Mike McCarthy, W1NR wrote:
>>
>>> I am running opensuse 10.0 with kernel 2.6.13-15.7 and the mkiss =20
>>> module is broken.  In looking through the archives it appears that =
=20
>>> it got fixed in 2.6.14.  Will there be a patch released for the =20
>>> 2.6.13 kernel that will propagate to the opensuse online update?  =20
>>> Where can I get the latest source file for mkiss that I can  manual=
ly=20
>>> compile it under 2.6.13?
>>>
>>> Thanks,
>>> Mike, W1NR
>>>
>>> -
>>> To unsubscribe from this list: send the line "unsubscribe linux-=20
>>> hams" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>> -
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20
Joni B=E4cklund, Tel +358400665775, FAX +35898042007
      Email: joni@connect.fi, oh2njr@sral.fi
   Amateur packet radio AX25: oh2njr@oh2rbj.fin.eu
  Some kind of Homepage: http://www.connect.fi/joni
" The Choice of a GNU generation:  Debian Linux 3.1 "
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
