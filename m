From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: INP3 patch + yam = kernel oops
Date: Fri, 4 Apr 2003 23:55:22 +0200
Sender: linux-hams-owner@localhost
Message-ID: <20030404235522.E1131@jeroen.pe1rxq.ampr.org>
References: <200304022112.07835.oyvind@cs.uit.no>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200304022112.07835.oyvind@cs.uit.no>; from oyvind@cs.uit.no on Wed, Apr 02, 2003 at 21:12:07 +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

On 2003.04.02 21:12:07 +0200 =D8yvind Hanssen wrote:
>=20
> I was thinking of giving up and do without INP3, but if anyone knows =
this
> problem and=20
> perhaps a hint where to look?? I used the patch which was meant for a
> 2.4.19 prerelease, but
> agains the official 2.4.19 kernel source. I cant find any other info =
on
> this than:=20
> http://sharon.pi8zaa.ampr.org/users/pe1rxq/inp3.html
>=20
> Btw. What is the "sock_orphan patch"?

Its a fix for a prblem with earlier 2.4 kernels that would crash as alm=
ost
immediatly.

I haven't tried the patch on a 'real' 2.4.19 source yet so it could be =
the
cause...
But ax25 in 2.4 is terribly broken :(

On a side note does anybody know how the status of ax25 in 2.5 is?
I know there have been some changes, but I don't get replies from any m=
ails
to the author....

I just want to know if it is just as likely to crash as 2.4, more likel=
y or
is it getting better?
In other words is it worth to try??? What needs to be done? Can I help?=
??

	Jeroen

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
