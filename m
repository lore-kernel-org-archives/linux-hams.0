From: Bernard Pidoux F6BVP <f6bvp@free.fr>
Subject: Re: fbbsrc.704r5 compile error
Date: Sun, 20 Sep 2009 12:34:57 +0200
Message-ID: <4AB60551.7080605@free.fr>
References: <19EFA90488264123AF73C3EB1EA74B62@ngj> <4AB2E34E.7070907@exemail.com.au> <4AB38883.2090805@free.fr> <BC95AC1740034FE796CAA73C11319A31@HOLLYWOOD.HOLLYWOOD.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <BC95AC1740034FE796CAA73C11319A31@HOLLYWOOD.HOLLYWOOD.COM>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jose Ng Lee <jng@psi.net.pa>
Cc: linux-hams <linux-hams@vger.kernel.org>, Ray Wells <vk2tv@exemail.com.au>, C Schuman <k4gbb1@embarqmail.com>, List for the LINUX version of FBB <xfbb@f6fbb.org>, Bob Tenty <bobtenty@gmail.com>, Peter Mallett <zl2bau@xtra.co.nz>

Hi,

I released FBB 704r-pre6.
This is still a pre release version for evaluation purpose.
It should replace 704s series and 704r4 and 704r5 that had some issues =
regarding forwarding
and stack overflow (stack-smashing).

You may download FBB package from :
http://f6bvp.free.fr/logiciels/BBS-f6fbb/xd704r6-src.tar.bz2

Here is an extract of CHANGES file :

7.04r.2 (F6BVP)
- less verbose debugging messages in /var/log/fbb.log
- Added usleep instructions to allow interrupts in tcp and sock drivers=
 and
  reduce CPU load. It was sometime more than 14% and should be less tha=
n 1% now.

7.04r.2.1 (F6BVP)
- s_status was writing zero length frame. Corrected
- date structure corrupted in ibm.c caused  stack-smashing. Corrected.
- changed date format tm_year %100 in console.c to avoid stack overflow=
 due to incorrect date format
  during FBB initialization.
- CFLAGS =3D -Wall -Wstrict-prototypes -funsigned-char $(DEFS) -D__LINU=
X__=20
           -Wformat-security -D_FORTIFY_SOURCE=3D2  -DPROTOTYPES -I../i=
nclude -fstack-check
           -fstack-protector-all (this DEBUG option is removed in distr=
ibuted package)

7.04r.2.2 (F6BVP) is 7.04r6
- cree_bid() did not actually create WFBID.SYS and initialize it if fil=
e was missing.=20
  This could induce a segment violation. Corrected.
- In case of test or PRE versions the full release number is displayed =
:
  *********************************************************           =20
  * XFBB Linux daemon version 7.04r-pre6 (Sep  18 2009) PID=3D9172     =
   =20
- Same full version number is used in /var/ax25/fbb/log/ files
  070522165800SI *** BBS Initialize
  070522170200SA *** BBS Online 7.04r-pre6
- By default 20_epursat script does not export satdoc and satupdat resu=
lts to mail.


73 de Bernard, f6bvp


Jose Ng Lee a =E9crit :
> Hi Bernard,
>=20
> Thanks for the info.  OK, I understood it is experimental phase.
>=20
> So, I downloaded 704r2 and it did compiles OK with no modification on=
=20
> the Makefile.
>=20
> Thanks,
> 73s Jose / HP2AT
>=20
>=20
> ----- Original Message ----- From: "Bernard Pidoux F6BVP" <f6bvp@free=
=2Efr>
> To: "Ray Wells" <vk2tv@exemail.com.au>
> Cc: "Jose Ng Lee" <jng@psi.net.pa>; <linux-hams@vger.kernel.org>
> Sent: Friday, September 18, 2009 8:17 AM
> Subject: Re: fbbsrc.704r5 compile error
>=20
>=20
> Hi Jose,
>=20
> FBB 704r5 is a pre release.
> As such it is experimental in term of program code.
> Thus I had to validate a  number of debuging options.
> However, if needed you can, as suggested remove
>=20
> -fstack-protector-all
>=20
> argument in ../src/Makefile
>=20
> 73 de Bernard, f6bvp
>=20
>=20
>=20
> Ray Wells a =E9crit :
>> Jose,
>>
>> Stack protection was added after 2.6.16. I first encountered it=20
>> somewhere after 2.6.18, possibly in 2.6.22 but my memory is dim.
>>
>> There are advantages in moving to a newer kernel and that will fix=20
>> your current problem, but you'll possibly run into stack smashing wi=
th=20
>> xfbb, and it won't run.
>>
>> Bernard F6BVP is working on the xfbb code to eliminate some problems=
=2E=20
>> Some users are having success with Bernard's later releases but on m=
y=20
>> Debian 4.0 system (2.6.28) I still have to compile fbb with=20
>> -fno-stack-protection. I have the same issue on another system runni=
ng=20
>> Debian 4.0 with kernel 2.6.29-6. Both systems run fbb 7.04s-test.
>>
>> If you really need to stick with that old kernel you might get away=20
>> with commenting out the -DPROTOTYPES line. That's what I would try,=20
>> but be warned, I'm not a programmer.
>>
>> Bernard is across this list and may make comment.
>>
>> Ray vk2tv
>>
>> Jose Ng Lee wrote:
>>> Hi,
>>>
>>> I am using an old Linux Fedora 4 with kernel 2.6.16.14.  On this ol=
d=20
>>> machine, a few years ago I compiled OK fbb 7.04l and tried again=20
>>> today and compiles OK for that version.
>>>
>>> I downloaded the source for fbbsrc.704r5 and tried to compile but g=
ot=20
>>> this error:
>>>
>>> [root@hp2at src]# make
>>> gcc -Wall -Wstrict-prototypes -O2 -ggdb2 -funsigned-char  -D__LINUX=
__=20
>>> -Wformat-security  -D_FORTIFY_SOURCE=3D3D2 -DPROTOTYPES -I../includ=
e=20
>>> -fstack-check -fstack-protector-all  -DUSE_NCURSES   -c -o arbre.o=20
>>> arbre.c
>>> cc1: error: unrecognized command line option "-fstack-protector-all=
"
>>> make: *** [arbre.o] Error 1
>>> [root@hp2at src]#
>>>
>>> Please, anyone can help me or what I have to change in the Makefile=
=20
>>> to make it compile OK.
>>>
>>> Thanks,
>>> 73s Jose / HP2AT
>>> --=20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
