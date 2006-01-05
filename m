From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: Re: 2.6.13 mkiss update?
Date: Thu, 5 Jan 2006 15:41:50 -0500
Message-ID: <003101c61238$749b2130$680ea8c0@LoJackOne.LoJack.com>
References: <003301c6114b$180ecb80$680ea8c0@LoJackOne.LoJack.com> <001901c61202$d3f79310$680ea8c0@LoJackOne.LoJack.com> <43BD2E75.30406@connect.fi> <200601052129.26465.oh1mrr@nic.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=original"
To: jarmo <oh1mrr@nic.fi>, linux-hams@vger.kernel.org

Jarmo,
   You are not using the mkiss module or kissattach.  There in lies the=
=20
problem.

   I have confirmed that a hard system lockup occurs with 2.6.15-defaul=
t=20
even when all of the ax25 tools and libraries are recompiled from sourc=
e.=20
2.6.14-5 appears to be OK.

Mike, W1NR

----- Original Message -----=20
=46rom: "jarmo" <oh1mrr@nic.fi>
To: <linux-hams@vger.kernel.org>
Sent: Thursday, January 05, 2006 2:29 PM
Subject: Re: 2.6.13 mkiss update?


> Joni B=E4cklund wrote (l=E4hetysaika torstai, 5. tammikuuta 2006 16:3=
4):
>> I can confirm that running kissattach produces kernel panic with 2.6=
=2E15.
>> So do not use it until there is a patch available ! Seems that kerne=
l
>> ax25 developers are not quite sync with the kernel network code..
>
> Must be SuSe related, I have 2.6.15 (vanilla) working fine in
> my Mandriva cooker version.
> [root@oh1mrr oh1mrr]# /etc/rc.d/init.d/rc.ax25 start
> Loading module ax25                                             [  OK=
  ]
> Loading module netrom                                           [  OK=
  ]
> Loading module 6pack                                            [  OK=
  ]
> Setting up radio @ ttyS0 sp0AX.25 port radio bound to device sp0
>                                                                [  OK =
 ]
> Setting radio parameters                                        [  OK=
  ]
> Setting netrom for node NET/ROM port netrom bound to device nr0
>                                                                [  OK =
 ]
> Setting radio IP-parameters                                     [  OK=
  ]
> Setting netrom IP-parameters                                    [  OK=
  ]
> Starting ax25d                                                  [  OK=
  ]
> Starting netromd                                                [  OK=
  ]
> Starting ax25rtd                                                [  OK=
  ]
> Starting rxecho                                                 [  OK=
  ]
> Starting rip98d                                                 [  OK=
  ]
> Starting mheard                                                 [  OK=
  ]
> Setting local routes/usr/sbin/nrparms -routes radio oh1rcf-4 + 200
> /usr/sbin/nrparms -nodes OH1RCF-4 + RCFLIN 120 6 radio oh1rcf-4
> /usr/sbin/nrparms -routes radio oh1rdf-0 +2
> /usr/sbin/nrparms -nodes OH1RDF-0 + PORNIX 120 6 radio oh1rcf-4
>                                                                [  OK =
 ]
> All Done  !
>
> Jarmo
> --=20
> Linux is the answer.
> What was your question?
> (Brian Lane)
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
