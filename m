From: oz6bl@amsat.dk
Subject: Re: SUSE 9.3
Date: Thu, 1 Dec 2005 14:09:13 -0000 (UTC)
Message-ID: <32790.83.73.68.20.1133446153.squirrel@www.amsat.dk>
References: <20051130080452.M79581@ham.depa.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051130080452.M79581@ham.depa.gr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: sv1uy <sv1uy@ham.depa.gr>
Cc: linux-hams@vger.kernel.org

Hi Demetre,

sv1uy wrote:
>
> Has anyone managed to run AX25 in a SUSE 9.3 installation? ...
>

Yes, we have it running here at OZ7SAT on the PC that we use (used?) as
groundstation for SSETI Express.

>
> ... Then I uninstalled the rpms and tried to compile
> the latest tools form sourceforge but failed to compile ax25-apps and
> tools.

I'm aware of the RPMs that J=F6rg, DL1BKE, has made for Suse, bur I dec=
ided
to build my own from the sources at Sourceforge.

'hdlcutil' wouldn't compile - it complained about a missing soundmodem.=
h -
but I decided that I did not need it and instead cd'ed into the remaini=
ng
subdirectories (kiss, netrom, rose, tcpip,
user_call and yamdrv) and did 'make' here.

> So now I reinstalled the rpms and I get another problem stating that =
mkiss
> gets an IO error. BTW SUSE 9.3 installs kernel 2.6.11.
>

mkiss wil not run om twin-engined (or more) CPUs. I do not know if Ralf=
's
pathes has made to the official relase on 2.6.14, but 2.6.11 is definit=
ely
too old. You can run a default kernel in this case or upgrade - which i=
s
not a trivial task with Suse...

> If anyone is using SUSE 9.3 out there please tell me where did you ge=
t
> ax25-
> apps, ax25-tools and libax25 from and which version work successfully
> without having to recompile the kernel!
>
I got the latest sources from Sourceforge: ax25-apps-0.0.6,
ax25-tools-0.0.8 and libax25-0.0.11.

I hope this information is of use.

Best 73 de Bent/OZ6BL

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
