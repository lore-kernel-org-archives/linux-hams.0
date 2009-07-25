From: F8arr <f8arr@f8arr.org>
Subject: Re: Problems with net2kiss
Date: Sat, 25 Jul 2009 19:29:11 +0200
Message-ID: <0E76106E-3A20-4BA6-857C-633DFD2A2EE8@f8arr.org>
References: <8390870f0907250837j13e27ce4ga4f91609ea53cd6c@mail.gmail.com>
Mime-Version: 1.0 (iPhone Mail 7A341)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <8390870f0907250837j13e27ce4ga4f91609ea53cd6c@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: Stephen - K1LNX <k1lnx@k1lnx.net>
Cc: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Hi,

Perhaps a kernel issue, on new kernels pseudos tty are not available.
Somers radio ham in France had to compile a new kernel for same problem=
s

=468arr


Envoy=C3=A9 de mon t=C3=A9l=C3=A9phone.

Le 25 juil. 2009 =C3=A0 17:37, Stephen - K1LNX <k1lnx@k1lnx.net> a =C3=A9=
crit :

> I am having a problem with net2kiss on a Debian 5.0 "Lenny" install. =
I
> installed ax25-tools from apt.
>
> If I execute this command:
>
> net2kiss -a -i ax0 -s /tmp/net2kisslink &
>
> It errors out with this:
>
> net2kiss: out of pseudoterminals
>
> I tried increasing the number of available pty's as detailed here:
> http://www.cyberciti.biz/tips/howto-linux-increase-pty-session.html
> but it didn't help.
>
> I was also able to duplicate this on a fresh install of Lenny on
> another machine, maybe something up with the package?
>
> Has anyone ever seen this and how to fix it?
>
> tnx and 73
> Stephen
>
> -- =20
> Stephen Brown - ARS K1LNX
> Johnson City, TN EM86
> http://www.k1lnx.net
> --
> To unsubscribe from this list: send the line "unsubscribe linux-=20
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
