From: Bernard Pidoux F6BVP <f6bvp@free.fr>
Subject: Re: fbbsrc.704r5 compile error
Date: Fri, 18 Sep 2009 15:17:55 +0200
Message-ID: <4AB38883.2090805@free.fr>
References: <19EFA90488264123AF73C3EB1EA74B62@ngj> <4AB2E34E.7070907@exemail.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4AB2E34E.7070907@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ray Wells <vk2tv@exemail.com.au>
Cc: Jose Ng Lee <jng@psi.net.pa>, linux-hams@vger.kernel.org

Hi Jose,

=46BB 704r5 is a pre release.
As such it is experimental in term of program code.
Thus I had to validate a  number of debuging options.
However, if needed you can, as suggested remove

-fstack-protector-all =20

argument in ../src/Makefile

73 de Bernard, f6bvp



Ray Wells a =E9crit :
> Jose,
>=20
> Stack protection was added after 2.6.16. I first encountered it=20
> somewhere after 2.6.18, possibly in 2.6.22 but my memory is dim.
>=20
> There are advantages in moving to a newer kernel and that will fix yo=
ur=20
> current problem, but you'll possibly run into stack smashing with xfb=
b,=20
> and it won't run.
>=20
> Bernard F6BVP is working on the xfbb code to eliminate some problems.=
=20
> Some users are having success with Bernard's later releases but on my=
=20
> Debian 4.0 system (2.6.28) I still have to compile fbb with=20
> -fno-stack-protection. I have the same issue on another system runnin=
g=20
> Debian 4.0 with kernel 2.6.29-6. Both systems run fbb 7.04s-test.
>=20
> If you really need to stick with that old kernel you might get away w=
ith=20
> commenting out the -DPROTOTYPES line. That's what I would try, but be=
=20
> warned, I'm not a programmer.
>=20
> Bernard is across this list and may make comment.
>=20
> Ray vk2tv
>=20
> Jose Ng Lee wrote:
>> Hi,
>>
>> I am using an old Linux Fedora 4 with kernel 2.6.16.14.  On this old=
=20
>> machine, a few years ago I compiled OK fbb 7.04l and tried again tod=
ay=20
>> and compiles OK for that version.
>>
>> I downloaded the source for fbbsrc.704r5 and tried to compile but go=
t=20
>> this error:
>>
>> [root@hp2at src]# make
>> gcc -Wall -Wstrict-prototypes -O2 -ggdb2 -funsigned-char  -D__LINUX_=
_=20
>> -Wformat-security -D_FORTIFY_SOURCE=3D3D2 -DPROTOTYPES -I../include=20
>> -fstack-check -fstack-protector-all -DUSE_NCURSES   -c -o arbre.o ar=
bre.c
>> cc1: error: unrecognized command line option "-fstack-protector-all"
>> make: *** [arbre.o] Error 1
>> [root@hp2at src]#
>>
>> Please, anyone can help me or what I have to change in the Makefile =
to=20
>> make it compile OK.
>>
>> Thanks,
>> 73s Jose / HP2AT
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>=20
> --=20
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
