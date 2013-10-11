From: walter harms <wharms@bfs.de>
Subject: Re: Odp: Re: patch INP3 for kernel 3.6
Date: Fri, 11 Oct 2013 13:05:31 +0200
Message-ID: <5257DB7B.8040402@bfs.de>
References: <5243ee588b32f4.42875689@wp.pl>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5243ee588b32f4.42875689@wp.pl>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Waldek <sp2ong@wp.pl>
Cc: linux-hams <linux-hams@vger.kernel.org>



Am 26.09.2013 10:20, schrieb Waldek:
> Ok I have try compile kernel 3.6 with fixed rejected netrom.h and pat=
ch don't working with 3.6 kernel
>=20
>  CC [M]  net/netrom/af_netrom.o
> In file included from net/netrom/af_netrom.c:40:0:
> include/net/netrom.h:72:27: warning: declaration does not declare any=
thing [enabled by default]
> net/netrom/af_netrom.c: In function 'nr_ioctl':
> net/netrom/af_netrom.c:1261:3: error: implicit declaration of functio=
n 'inp3_set_mnem' [-Werror=3Dimplicit-function-declaration]
> net/netrom/af_netrom.c:1269:3: error: implicit declaration of functio=
n 'inp3_get_mnem' [-Werror=3Dimplicit-function-declaration]
> net/netrom/af_netrom.c: In function 'nr_proto_init':
> net/netrom/af_netrom.c:1481:2: error: implicit declaration of functio=
n 'kinp3d_start' [-Werror=3Dimplicit-function-declaration]
> net/netrom/af_netrom.c: In function 'nr_exit':
> net/netrom/af_netrom.c:1512:2: error: implicit declaration of functio=
n 'kinp3d_stop' [-Werror=3Dimplicit-function-declaration]
> cc1: some warnings being treated as errors
> make[2]: *** [net/netrom/af_netrom.o] error 1
> make[1]: *** [net/netrom] error 2
> make: *** [net] error 2
>=20
>=20
do not worry,
he is missing the function declaration (inp3_set_mnem,kinp3d_start) onl=
y,
create them an this problem is fixed. Normaly this is only a warning bu=
t
"some warnings being treated as errors"

re,
 wh


> Dnia Czwartek, 26 Wrze=B6nia 2013 10:10 Matt Maguire <matt.vk2rq@gmai=
l.com> napisa=B3(a)=20
>> I'm not surprised it doesn't apply cleanly -- it is for 2.6 kernel,
>> not 3.6. Even if it did apply, I wouldn't use it until the deadlock
>> issue is addressed -- that's why I was interested to hear that someo=
ne
>> else made a patch for 2.6, as I am curious whether they also fixed t=
he
>> deadlock issue inherited from the 2.4 patch.
>=20
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
