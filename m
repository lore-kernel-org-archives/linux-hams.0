From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: 2.6.13 mkiss update?
Date: Fri, 06 Jan 2006 00:08:23 +0100
Message-ID: <43BDA6E7.1030309@ccr.jussieu.fr>
References: <003301c6114b$180ecb80$680ea8c0@LoJackOne.LoJack.com> <001901c61202$d3f79310$680ea8c0@LoJackOne.LoJack.com> <43BD2E75.30406@connect.fi> <200601052129.26465.oh1mrr@nic.fi> <003101c61238$749b2130$680ea8c0@LoJackOne.LoJack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <003101c61238$749b2130$680ea8c0@LoJackOne.LoJack.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc: jarmo <oh1mrr@nic.fi>, linux-hams@vger.kernel.org

Hi,

Running here Mandriva Linux 2006 distro with updated kernels (2.6.14-3=20
on one machine and 2.6.14-4 on another) without any problem with AX25=20
code, even with mkiss.

It would be nice to have a small group of beta testers before a=20
modification is introduced in AX25 drivers for future kernels.

I volunteer for beta testing.

73 de Bernard, f6bvp

http://f6bvp.free
http://f6bvp.org (mirror)

----------------

Mike McCarthy, W1NR a =E9crit :
> Jarmo,
>   You are not using the mkiss module or kissattach.  There in lies th=
e=20
> problem.
>=20
>   I have confirmed that a hard system lockup occurs with 2.6.15-defau=
lt=20
> even when all of the ax25 tools and libraries are recompiled from=20
> source. 2.6.14-5 appears to be OK.
>=20
> Mike, W1NR
>=20
> ----- Original Message ----- From: "jarmo" <oh1mrr@nic.fi>
> To: <linux-hams@vger.kernel.org>
> Sent: Thursday, January 05, 2006 2:29 PM
> Subject: Re: 2.6.13 mkiss update?
>=20
>=20
>> Joni B=E4cklund wrote (l=E4hetysaika torstai, 5. tammikuuta 2006 16:=
34):
>>
>>> I can confirm that running kissattach produces kernel panic with 2.=
6.15.
>>> So do not use it until there is a patch available ! Seems that kern=
el
>>> ax25 developers are not quite sync with the kernel network code..
>>
>>
>> Must be SuSe related, I have 2.6.15 (vanilla) working fine in
>> my Mandriva cooker version.
>> [root@oh1mrr oh1mrr]# /etc/rc.d/init.d/rc.ax25 start
>> Loading module ax25                                             [  O=
K  ]
>> Loading module netrom                                           [  O=
K  ]
>> Loading module 6pack                                            [  O=
K  ]
>> Setting up radio @ ttyS0 sp0AX.25 port radio bound to device sp0
>>                                                                [  OK=
  ]
>> Setting radio parameters                                        [  O=
K  ]
>> Setting netrom for node NET/ROM port netrom bound to device nr0
>>                                                                [  OK=
  ]
>> Setting radio IP-parameters                                     [  O=
K  ]
>> Setting netrom IP-parameters                                    [  O=
K  ]
>> Starting ax25d                                                  [  O=
K  ]
>> Starting netromd                                                [  O=
K  ]
>> Starting ax25rtd                                                [  O=
K  ]
>> Starting rxecho                                                 [  O=
K  ]
>> Starting rip98d                                                 [  O=
K  ]
>> Starting mheard                                                 [  O=
K  ]
>> Setting local routes/usr/sbin/nrparms -routes radio oh1rcf-4 + 200
>> /usr/sbin/nrparms -nodes OH1RCF-4 + RCFLIN 120 6 radio oh1rcf-4
>> /usr/sbin/nrparms -routes radio oh1rdf-0 +2
>> /usr/sbin/nrparms -nodes OH1RDF-0 + PORNIX 120 6 radio oh1rcf-4
>>                                                                [  OK=
  ]
>> All Done  !
>>
>> Jarmo
>> --=20
>> Linux is the answer.
>> What was your question?
>> (Brian Lane)
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
>=20
>=20
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
