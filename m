From: "Bernard, f6bvp" <f6bvp@free.fr>
Subject: Re: Compiling FBB
Date: Sat, 15 Oct 2011 09:55:46 +0200
Message-ID: <4E993C82.2090601@free.fr>
References: <4E93FBEC.7050907@free.fr> <4E98B35E.1050602@eunet.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E98B35E.1050602@eunet.rs>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Miroslav Skoric <skoric@eunet.rs>
Cc: linux-hams <linux-hams@vger.kernel.org>, Lee Woldanski <ve7fet@tparc.org>

Hello Miroslav,

I now understand the libax25 issue.
Debian and alike libax25 packages are installing AX.25 libraries into=20
/usr/lib/ whereas by default xfbb link process is expecting libax25.* i=
n=20
/usr/local/lib directory.

You will certainly know how to edit Makefile in order to tell it where=20
to find the libraries.

I must say that for many reasons I do prefere to get all hamradio=20
applications and libraries in /usr/local subdirectories.
This is more convenient for backups and file search.

Last remark : there have been some updates and bug removals in the=20
"unofficial" libax25, tools and apps that I gave you as compared to the=
=20
"old one" you are using (libax25 > 0.0.11-6.1).

This is the result of an intensive work performed by Lee VE7FET with=20
=46PAC development team. The site I gave you the address has Debian /=20
Ubuntu compatible packages. You should consider using them. This will=20
not break anything in your application but rather remove some failure=20
causes.


73 de Bernard, f6bvp



Le 15/10/2011 00:10, Miroslav Skoric a =E9crit :
> On 10/11/2011 10:18 AM, f6bvp wrote:
>> *Hello Miroslav,
>>
>> It looks like you did not install AX.25 libraries (libax25) before
>> installing FBB.
>> Look at the following link :
>>
>> http://code.google.com/p/linuxax25/
>>
>> 73 de Bernard, f6bvp
>>
>
> Hi Bernard,
>
> I already had libax25 (as well as ax25-apps and ax25-tools) before
> trying to compile FBB. Btw, in respect to repositories of Ubuntu and
> Debian communities, I installed the version they both provided: libax=
25
> 0.0.11-6.1)
>
> However, I checked the link above, but not sure what their versions
> might help me in regard to the FBB compiling issue. In fact, I would
> like to keep the existing ax25 stuff, provided they bring basic
> functionality (for example, I managed to activate a few Linux nodes i=
n
> Ubuntu and Debian, and now I am in the process of configuring them to
> interact with Win/BPQ32 nodes in the mixed Lin/Win dual-boot environm=
ent.)
>
> What else could I eventually try to install/reinstall?
>
> Misko, YT7MPB
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
