From: jarmo <oh1mrr@nic.fi>
Subject: Re: 2.6.13 mkiss update?
Date: Thu, 5 Jan 2006 21:29:26 +0200
Message-ID: <200601052129.26465.oh1mrr@nic.fi>
References: <003301c6114b$180ecb80$680ea8c0@LoJackOne.LoJack.com> <001901c61202$d3f79310$680ea8c0@LoJackOne.LoJack.com> <43BD2E75.30406@connect.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43BD2E75.30406@connect.fi>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Joni B=E4cklund wrote (l=E4hetysaika torstai, 5. tammikuuta 2006 16:34)=
:
> I can confirm that running kissattach produces kernel panic with 2.6.=
15.
> So do not use it until there is a patch available ! Seems that kernel
> ax25 developers are not quite sync with the kernel network code..

Must be SuSe related, I have 2.6.15 (vanilla) working fine in
my Mandriva cooker version.
[root@oh1mrr oh1mrr]# /etc/rc.d/init.d/rc.ax25 start
Loading module ax25                                             [  OK  =
]
Loading module netrom                                           [  OK  =
]
Loading module 6pack                                            [  OK  =
]
Setting up radio @ ttyS0 sp0AX.25 port radio bound to device sp0
                                                                [  OK  =
]
Setting radio parameters                                        [  OK  =
]
Setting netrom for node NET/ROM port netrom bound to device nr0
                                                                [  OK  =
]
Setting radio IP-parameters                                     [  OK  =
]
Setting netrom IP-parameters                                    [  OK  =
]
Starting ax25d                                                  [  OK  =
]
Starting netromd                                                [  OK  =
]
Starting ax25rtd                                                [  OK  =
]
Starting rxecho                                                 [  OK  =
]
Starting rip98d                                                 [  OK  =
]
Starting mheard                                                 [  OK  =
]
Setting local routes/usr/sbin/nrparms -routes radio oh1rcf-4 + 200
/usr/sbin/nrparms -nodes OH1RCF-4 + RCFLIN 120 6 radio oh1rcf-4
/usr/sbin/nrparms -routes radio oh1rdf-0 +2
/usr/sbin/nrparms -nodes OH1RDF-0 + PORNIX 120 6 radio oh1rcf-4
                                                                [  OK  =
]
All Done  !

Jarmo
--=20
Linux is the answer.
What was your question?
(Brian Lane)
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
