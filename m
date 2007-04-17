From: Jim Tittsler <7J1AJH@OnJapan.net>
Subject: Re: Error compiling aprsd-2.2.5-15
Date: Wed, 18 Apr 2007 11:40:06 +1200
Message-ID: <F754A7D0-3D8A-4F72-B235-4F0D0A6E28EF@OnJapan.net>
References: <20070313115537.GA10921@linux-mips.org> <20070324.125436.115921208.davem@davemloft.net> <4624D993.1060006@ccr.jussieu.fr>
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4624D993.1060006@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; delsp="yes	format=flowed"
To: linux-hams@vger.kernel.org

On Apr 18, 2007, at 02:28, Bernard Pidoux wrote:

> I did ./configure without problem but got g++ warning and the =20
> following
> error :
>
> deprecated header <iostream.h>. To disable this warning use -Wno-=20
> deprecated.
> aprsString.h:199: error: extra qualification =91aprsd::aprsString::=92=
 on
> member =91getMsgText=92

If you don't want to update the aprsd source, an easy way out is to =20
install an older version of g++.  Many linux distributions keep an =20
old gcc 3.4.x era g++ (which can be installed alongside the current =20
release) around for just such occasions.


--=20
Jim Tittsler  ZL2IA/AI8A    Gisborne                GPG: 0x01159DB6
http://www.qsl.net/7j1ajh/                       QRP/Satellites/APRS
                                                          AMSAT/NZART


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
