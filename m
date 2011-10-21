From: Lee Woldanski <ve7fet@tparc.org>
Subject: Re: Compiling FBB
Date: Fri, 21 Oct 2011 10:11:10 -0700
Message-ID: <CACaEaZmyW6GwSaQFeudX0EuqyEKyL6rGRBEsbZxjcwKqRbRCyA@mail.gmail.com>
References: <4E93FBEC.7050907@free.fr>
	<4E98B35E.1050602@eunet.rs>
	<4E993C82.2090601@free.fr>
	<4EA0EEE4.7050502@trinnet.net>
	<4EA14651.7000108@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4EA14651.7000108@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Ranch <linux-hams@trinnet.net>
Cc: "Bernard, f6bvp" <f6bvp@free.fr>, ralf@linux-mips.org, linux-hams <linux-hams@vger.kernel.org>, ax25@x-berg.in-berlin.de

As Bernard has eluded to, I am maintaining my own copies of the
official AX.25 suite at http://linuxax25.googlecode.com.

This is a personal project so that I can package up the source for
easier deployment to my embedded systems. If someone else finds it
useful, that's great.

I have taken the CVS source from http://www.linux-ax25.org and
re-organized it a bit, and integrated it with Autotools. It makes it
easier to build and maintain, in my opinion.

I have used the CVS source as my code base, since there are a number
of bug fixes in there that are not present in the current released
version.

I would like all patches and bug fixes to be sent to the official
maintainers, as I pull my changes from there. That said, I wouldn't
mind a heads up on any submitted patches, so I can keep an eye open
for them when they are accepted (since I manually check for diffs
periodically).


Cheers!

Lee
VE7FET


On Fri, Oct 21, 2011 at 3:15 AM, Bernard, f6bvp <f6bvp@free.fr> wrote:
> Hello Misko,
>
> Lee Ve7fet is the maintainer of "unofficial" AX.25 suite.
> These AX.25 programs are constantly updated, as opposed to the certai=
nly too
> slowly maintained "official" versions.
>
> We are willing to repare all known bugs as soon as possible.
>
> If you have personal solutions to known or unknown bugs, please let u=
s know
> by sending patches to the linux-ham list with copies to Ralf DL5BE.
>
> We will do our best to improve the AX.25 libraries and applications.
>
> 73 de Bernard, f6bvp
>
> Le 21/10/2011 06:02, David Ranch a =E9crit :
>>
>> Hello Bernard, Ralf, Thomas,
>>
>> I've been meaning to ask this question for a while now: Do you know =
why
>> the official version of the ax25 apps/libs/tools hasn't been updated=
 in
>> ages? I've been slowly hacking up the legacy "released" versions to =
work
>> around bugs I've found in my personal uses and I'm sure there are ot=
her
>> issues I haven't hit.. yet:
>>
>> nrattach.c - non-incrementing nr interfaces (netrom)
>> http://marc.info/?l=3Dlinux-hams&m=3D125646640011531&w=3D2
>>
>> axipd/kiss.c - control byte non-zero when used for axudp tunnels
>> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D606338
>>
>>
>> It seems that many of these issues are resolved in the official CVS =
but
>> maybe other issues as you pointed out in that Google URL aren't. It
>> would be nice if we could at least get the current CVS pushed out as=
 say
>> a new official version of 0.0.13 and be aligned across all three
>> packages. Even better, have this 0.0.13 version integrate the fixes =
in
>> the Google repo too?
>>
>> --David
>>
>>
>>
>> Bernard, f6bvp wrote:
>>>
>>> Hello Miroslav,
>>>
>>> I now understand the libax25 issue.
>>> Debian and alike libax25 packages are installing AX.25 libraries in=
to
>>> /usr/lib/ whereas by default xfbb link process is expecting libax25=
=2E*
>>> in /usr/local/lib directory.
>>>
>>> You will certainly know how to edit Makefile in order to tell it wh=
ere
>>> to find the libraries.
>>>
>>> I must say that for many reasons I do prefere to get all hamradio
>>> applications and libraries in /usr/local subdirectories.
>>> This is more convenient for backups and file search.
>>>
>>> Last remark : there have been some updates and bug removals in the
>>> "unofficial" libax25, tools and apps that I gave you as compared to
>>> the "old one" you are using (libax25 > 0.0.11-6.1).
>>>
>>> This is the result of an intensive work performed by Lee VE7FET wit=
h
>>> FPAC development team. The site I gave you the address has Debian /
>>> Ubuntu compatible packages. You should consider using them. This wi=
ll
>>> not break anything in your application but rather remove some failu=
re
>>> causes.
>>>
>>>
>>> 73 de Bernard, f6bvp
>>>
>>>
>>>
>>> Le 15/10/2011 00:10, Miroslav Skoric a =E9crit :
>>>>
>>>> On 10/11/2011 10:18 AM, f6bvp wrote:
>>>>>
>>>>> *Hello Miroslav,
>>>>>
>>>>> It looks like you did not install AX.25 libraries (libax25) befor=
e
>>>>> installing FBB.
>>>>> Look at the following link :
>>>>>
>>>>> http://code.google.com/p/linuxax25/
>>>>>
>>>>> 73 de Bernard, f6bvp
>>>>>
>>>>
>>>> Hi Bernard,
>>>>
>>>> I already had libax25 (as well as ax25-apps and ax25-tools) before
>>>> trying to compile FBB. Btw, in respect to repositories of Ubuntu a=
nd
>>>> Debian communities, I installed the version they both provided: li=
bax25
>>>> 0.0.11-6.1)
>>>>
>>>> However, I checked the link above, but not sure what their version=
s
>>>> might help me in regard to the FBB compiling issue. In fact, I wou=
ld
>>>> like to keep the existing ax25 stuff, provided they bring basic
>>>> functionality (for example, I managed to activate a few Linux node=
s in
>>>> Ubuntu and Debian, and now I am in the process of configuring them=
 to
>>>> interact with Win/BPQ32 nodes in the mixed Lin/Win dual-boot
>>>> environment.)
>>>>
>>>> What else could I eventually try to install/reinstall?
>>>>
>>>> Misko, YT7MPB
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-ham=
s" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>



--=20
Lee Woldanski, AScT
VE7FET
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
