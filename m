From: "Neville Cross" <neville@guegue.com>
Subject: Re: FPAC and Fedora8
Date: Mon, 21 Apr 2008 21:28:09 -0600 (CST)
Message-ID: <19621.192.136.45.2.1208834889.squirrel@mail.guegue.com>
References: <480A6034.1080806@ccr.jussieu.fr>
    <9891.165.98.185.2.1208717019.squirrel@mail.guegue.com>
    <480C72FD.6090706@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <480C72FD.6090706@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hello Bernard,

I just checked my kernel and it turn out to be: 2.6.24.4-64.fc8

And I did not used your packages, I have installed the packages that we=
re
ready for install from the fedora repository.

I did the compilation once, but I was looking to test a more user frien=
dly
way to share with colleagues that are not as able in computing or do no=
t
speak English. Not that I am that good at computer or English.

I am a bit afraid of compiling a new kernel version, as this may get in
the way for regular updates. This is not really an issue for an Ax25
discussion, so I will go to my Fedora community for support and get bac=
k
to the list in a day or two with the kernel and packages ready.

By the way, I found very easy to follow the MINI-HOWTO for FPAC.

Thanks

Neville A. Cross - YN1V


> Hi Neville,
>
> I wonder if you installed libax25, ax25-tools and ax25-apps I have
> configured for 2.6 kernel directory tree.
>
> http://f6bvp.free.fr/logiciels/ax25/libax25-0.0.11.4src_f6bvp.tgz
> http://f6bvp.free.fr/logiciels/ax25/ax25-apps-0.0.6.2src_f6bvp.tgz
> http://f6bvp.free.fr/logiciels/ax25/ax25-tools-0.0.8.2src_f6bvp.tgz
>
> Fedora distro is not very different from Mandriva.
>
> If you follow the FPAC MINI HOWTO step by step you should have no
> problems for FPAC compilation.
>
> Also I strongly suggest that you upgrade your kernel.
> Linux 2.6.25 kernel includes a number of important
> fixes about AX25 module.
>
> 73 de Bernard, f6bvp
>
>
> Neville Cross wrote:
>> Hello,
>>
>> I have trying to setup a FBB station using Fedora 8. The good thing =
is
>> that Fedora has the ax25 protocol already configured as module, it i=
s
>> matter only to call it up. I already have working ax25 outbound
>> connections via RF.
>>
>> In my different test I came to the problem of configuring other  ite=
ms
>> as
>> ax25d and and ax25ipd. A friend TI2HAS commented to me that a good w=
ay
>> to
>> ensure the connections was using FPAC as node, and it will also serv=
e as
>> gateway.
>>
>> So I gave a try to FPAC looking the mini-howto at
>> http://rose.fpac.free.fr/MINI-HOWTO
>> and also looking the howto at
>> http://ftp.f6fbb.org/fpac/doc/FPAC-HOWTO.html
>>
>> Some of the questions that I have are:
>> How do I know numbers to use? There is any coordinator to ask?
>>
>> But beyond those question I got stuck with the command make. I got
>> errors,
>> I am not sure what they meant. I tried to modify the make.confs file=
 to
>> adapt the path to my setup but still no luck. I think that I may hav=
e a
>> problem with something that I have installed or I have not installed=
=2E
>>
>> I will appreciate any comments, ideas or suggestions. Please see bel=
ow
>> the
>> response from the system.
>>
>> Thanks in advance.
>>
>> Neville - YN1V
>> Sysop of YN1BBS
>>
>> ----------------------------------------------
>>
>> [root@localhost fpac327.13]# make
>> make[1]: Entering directory `/usr/local/src/ax25/fpac327.13/lib'
>> gcc -Wall -Wstrict-prototypes -I../lib -I/usr/include -c libwp.c
>> In file included from /usr/include/netax25/axlib.h:29,
>>                  from ax25compat.h:33,
>>                  from libwp.c:22:
>> /usr/include/netax25/ax25.h:74: error: conflicting types for
>> =EF=BF=BDax25_address=EF=BF=BD
>> /usr/include/linux/ax25.h:47: error: previous declaration of
>> =EF=BF=BDax25_address=EF=BF=BD was here
>> /usr/include/netax25/ax25.h:77: error: redefinition of =EF=BF=BDstru=
ct
>> sockaddr_ax25=EF=BF=BD
>> /usr/include/netax25/ax25.h:87: error: redefinition of =EF=BF=BDstru=
ct
>> full_sockaddr_ax25=EF=BF=BD
>> /usr/include/netax25/ax25.h:94: error: redefinition of =EF=BF=BDstru=
ct
>> ax25_routes_struct=EF=BF=BD
>> /usr/include/netax25/ax25.h:103: error: redefinition of =EF=BF=BDstr=
uct
>> ax25_ctl_struct=EF=BF=BD
>> /usr/include/netax25/ax25.h:114: error: redefinition of =EF=BF=BDstr=
uct
>> ax25_info_struct=EF=BF=BD
>> /usr/include/netax25/ax25.h:125: error: redefinition of =EF=BF=BDstr=
uct
>> ax25_fwd_struct=EF=BF=BD
>> /usr/include/netax25/ax25.h:132: error: redefinition of =EF=BF=BDstr=
uct
>> ax25_route_opt_struct=EF=BF=BD
>> In file included from /usr/include/netax25/axlib.h:30,
>>                  from ax25compat.h:33,
>>                  from libwp.c:22:
>> /usr/include/netrose/rose.h:68: error: conflicting types for
>> =EF=BF=BDrose_address=EF=BF=BD
>> /usr/include/linux/rose.h:44: error: previous declaration of
>> =EF=BF=BDrose_address=EF=BF=BD was here
>> /usr/include/netrose/rose.h:71: error: redefinition of =EF=BF=BDstru=
ct
>> sockaddr_rose=EF=BF=BD
>> /usr/include/netrose/rose.h:80: error: redefinition of =EF=BF=BDstru=
ct
>> full_sockaddr_rose=EF=BF=BD
>> /usr/include/netrose/rose.h:89: error: redefinition of =EF=BF=BDstru=
ct
>> rose_route_struct=EF=BF=BD
>> /usr/include/netrose/rose.h:99: error: redefinition of =EF=BF=BDstru=
ct
>> rose_cause_struct=EF=BF=BD
>> /usr/include/netrose/rose.h:105: error: redefinition of =EF=BF=BDstr=
uct
>> rose_facilities_struct=EF=BF=BD
>> libwp.c: In function =EF=BF=BDwp_update_addr=EF=BF=BD:
>> libwp.c:762: warning: passing argument 1 of =EF=BF=BDwp_get=EF=BF=BD=
 from
>> incompatible
>> pointer type
>> libwp.c: At top level:
>> libwp.c:776: error: conflicting types for =EF=BF=BDwp_search=EF=BF=BD
>> wp.h:116: error: previous declaration of =EF=BF=BDwp_search=EF=BF=BD=
 was here
>> libwp.c: In function =EF=BF=BDwp_search=EF=BF=BD:
>> libwp.c:780: warning: passing argument 1 of =EF=BF=BDwp_get=EF=BF=BD=
 from
>> incompatible
>> pointer type
>> libwp.c: At top level:
>> libwp.c:870: error: conflicting types for =EF=BF=BDwp_get=EF=BF=BD
>> wp.h:110: error: previous declaration of =EF=BF=BDwp_get=EF=BF=BD wa=
s here
>> libwp.c: In function =EF=BF=BDwp_get=EF=BF=BD:
>> libwp.c:880: error: incompatible types in assignment
>> make[1]: *** [libwp.o] Error 1
>> make[1]: Leaving directory `/usr/local/src/ax25/fpac327.13/lib'
>> make: *** [all] Error 2
>> [root@localhost fpac327.13]#
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
