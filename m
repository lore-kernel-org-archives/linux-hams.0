From: "Bernard, f6bvp" <f6bvp@free.fr>
Subject: Re: Compiling FBB
Date: Fri, 21 Oct 2011 12:15:45 +0200
Message-ID: <4EA14651.7000108@free.fr>
References: <4E93FBEC.7050907@free.fr> <4E98B35E.1050602@eunet.rs> <4E993C82.2090601@free.fr> <4EA0EEE4.7050502@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4EA0EEE4.7050502@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>
Cc: ralf@linux-mips.org, linux-hams <linux-hams@vger.kernel.org>, ax25@x-berg.in-berlin.de, Lee Woldanski <ve7fet@tparc.org>

Hello Misko,

Lee Ve7et is the maintainer of "unofficial" AX.25 suite.
These AX.25 programs are constantly updated, as opposed to the certainl=
y=20
too slowly maintained "official" versions.

We are willing to repare all known bugs as soon as possible.

If you have personal solutions to known or unknown bugs, please let us=20
know by sending patches to the linux-ham list with copies to Ralf DL5BE=
=2E

We will do our best to improve the AX.25 libraries and applications.

73 de Bernard, f6bvp

Le 21/10/2011 06:02, David Ranch a =E9crit :
>
> Hello Bernard, Ralf, Thomas,
>
> I've been meaning to ask this question for a while now: Do you know w=
hy
> the official version of the ax25 apps/libs/tools hasn't been updated =
in
> ages? I've been slowly hacking up the legacy "released" versions to w=
ork
> around bugs I've found in my personal uses and I'm sure there are oth=
er
> issues I haven't hit.. yet:
>
> nrattach.c - non-incrementing nr interfaces (netrom)
> http://marc.info/?l=3Dlinux-hams&m=3D125646640011531&w=3D2
>
> axipd/kiss.c - control byte non-zero when used for axudp tunnels
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D606338
>
>
> It seems that many of these issues are resolved in the official CVS b=
ut
> maybe other issues as you pointed out in that Google URL aren't. It
> would be nice if we could at least get the current CVS pushed out as =
say
> a new official version of 0.0.13 and be aligned across all three
> packages. Even better, have this 0.0.13 version integrate the fixes i=
n
> the Google repo too?
>
> --David
>
>
>
> Bernard, f6bvp wrote:
>> Hello Miroslav,
>>
>> I now understand the libax25 issue.
>> Debian and alike libax25 packages are installing AX.25 libraries int=
o
>> /usr/lib/ whereas by default xfbb link process is expecting libax25.=
*
>> in /usr/local/lib directory.
>>
>> You will certainly know how to edit Makefile in order to tell it whe=
re
>> to find the libraries.
>>
>> I must say that for many reasons I do prefere to get all hamradio
>> applications and libraries in /usr/local subdirectories.
>> This is more convenient for backups and file search.
>>
>> Last remark : there have been some updates and bug removals in the
>> "unofficial" libax25, tools and apps that I gave you as compared to
>> the "old one" you are using (libax25 > 0.0.11-6.1).
>>
>> This is the result of an intensive work performed by Lee VE7FET with
>> FPAC development team. The site I gave you the address has Debian /
>> Ubuntu compatible packages. You should consider using them. This wil=
l
>> not break anything in your application but rather remove some failur=
e
>> causes.
>>
>>
>> 73 de Bernard, f6bvp
>>
>>
>>
>> Le 15/10/2011 00:10, Miroslav Skoric a =E9crit :
>>> On 10/11/2011 10:18 AM, f6bvp wrote:
>>>> *Hello Miroslav,
>>>>
>>>> It looks like you did not install AX.25 libraries (libax25) before
>>>> installing FBB.
>>>> Look at the following link :
>>>>
>>>> http://code.google.com/p/linuxax25/
>>>>
>>>> 73 de Bernard, f6bvp
>>>>
>>>
>>> Hi Bernard,
>>>
>>> I already had libax25 (as well as ax25-apps and ax25-tools) before
>>> trying to compile FBB. Btw, in respect to repositories of Ubuntu an=
d
>>> Debian communities, I installed the version they both provided: lib=
ax25
>>> 0.0.11-6.1)
>>>
>>> However, I checked the link above, but not sure what their versions
>>> might help me in regard to the FBB compiling issue. In fact, I woul=
d
>>> like to keep the existing ax25 stuff, provided they bring basic
>>> functionality (for example, I managed to activate a few Linux nodes=
 in
>>> Ubuntu and Debian, and now I am in the process of configuring them =
to
>>> interact with Win/BPQ32 nodes in the mixed Lin/Win dual-boot
>>> environment.)
>>>
>>> What else could I eventually try to install/reinstall?
>>>
>>> Misko, YT7MPB
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
