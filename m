From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: Re: AX25 patches and new FPAC 327.14-pre23 release
Date: Sun, 11 Apr 2010 18:59:24 +0200
Message-ID: <4BC1FFEC.1090402@upmc.fr>
References: <4B93F367.1000803@free.fr> <4B955E3C.2010303@free.fr> <4B95B589.5080000@embarqmail.com> <4B961217.1080002@free.fr> <4B998055.8040006@gmail.com> <4B9AAE22.9090307@upmc.fr> <4B9AE3F0.8050504@gmail.com> <4B9B68E8.70805@upmc.fr> <4B9C3A18.60605@xtra.co.nz> <4BC0B44B.1060707@upmc.fr> <20100411082520.GQ7246@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20100411082520.GQ7246@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: C Schuman <k4gbb1@embarqmail.com>, bobtenty@gmail.com, Jerry DeLong <KD4YAL@tampabay.rr.com>, Ray Wells <vk2tv@exemail.com.au>, List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>, linux-hams <linux-hams@vger.kernel.org>, Cathryn Mataga <cathryn@junglevision.com>

Hi Thomas,

I noticed that actual http://www.linux-ax25.org/wiki/Main_Page was back=
 on line :

"2010-03-29 Due to hardware defects the site was running from an outdat=
ed copy for a while.=20
The problem has been rectified now. Sorry for the inconvenience."

However, the site does not yet reflect the CVS state.=20
This is why I had to build patched package for our FPAC node Sysops.=20
I did not intend to resend the patches I had already submitted.
This is why I did not send any diff file.
I should have been more clear and I am sorry for the painfull task you =
had to perform.

I do agree that my axutils.c patch was not necessary.
The error message about "SSID between 0 and 15" was triggered by an app=
lication error
in FPAC and made me think the loop was too short, missing minus charact=
er.
I was wrong and you were absolutely right to reject the patch.
The error has been already corrected in FPAC.

I understand that ax25ipd is a very complicated application.
Before Cathryn Mataga's last modifications, there was a very useful imp=
rovement introduced
as soon as June 2005 by Steve Fraser VK5ASF. He added provision for dyn=
amic dns hosts.
We have been using this for ROSE/FPAC network since. It takes into acco=
unt nodes without
permanent IPs, when nodes have a dyndns.org or no-ip.org address, witho=
ut link failure when the
IP address changes suddenly.=20
Steve Fraser's patch and the improvements by Cathryn Mataga are constru=
ctive
and could be introduced into official ax25-apps package.

=46inaly, could you tell me what should be the package directory mode i=
n order to be safe
about security concern ? I would be glad to make the changes on next FP=
AC delivery.

Many thanks for your help.

73 de Bernard, f6bvp
=20

Thomas Osterried a =E9crit :
> Hello,
>=20
> On 2010-04-10 19:24:27 +0200, Bernard Pidoux <bernard.pidoux@upmc.fr>
> wrote in <4BC0B44B.1060707@upmc.fr>:
>> Hi All,
>>
>> Ax25 libraries, ax25-apps and ax25-tools available under -rc2 label
>> have a number of bugs that prevent ROSE network application FPAC to =
work properly.
>=20
> Unfortunately, Bernard does not send diffs for patches.
> I'd to do it on my own and comment it here.
>=20
>> List of main bugs in libax25 :
>> - in /usr/local/include/netax25/procutils.h, use entry is missing   =
in=20
>> struct proc_rs_neigh
>=20
> fixed in CVS head:
>=20
> http://www.linux-ax25.org/cvsweb/libax25/netax25/procutils.h.diff?r1=3D=
1.1;r2=3D1.2;f=3Dh
>=20
>  Revision 1.2: download - view: text, markup, annotated - select for =
diffs
> Thu Nov 26 17:37:41 2009 UTC (4 months, 1 week ago) by dl9sau
> Branches: MAIN
> CVS tags: HEAD
> Diff to: previous 1.1: preferred, colored
> Changes since revision 1.1: +20 -19 lines
>=20
> patch submitted by Bernard Pidoux f6bvp
> - in proc_ax25 structure timers members size declared in
>   procutils.h. Since in kernel 2.6 the timers are now in milliseconds=
,
>   they need more place to be saved (unsigned short --> unsigned long)=
=2E
> - in procutils.h and procutils.c
>   in structure proc_rs_neigh field "use" was missing,
>   in function read_proc_rs_neigh proc_rs_neigh use was not read
>=20
>> - in procutils.c, ax25_aton_entry(const char *name, char *buf)  firs=
t=20
>> while loop is < 6 and should be < 7 to allow checking minus characte=
r=20
>> before SSID
>>  in six letters callsigns.
>=20
> It's not procutils.c but axutils.c.
>=20
> Your proposed diff is:
>=20
> +++ libax25-0.0.12-rc2.patched_f6bvp/axutils.c  2010-04-07 22:38:09.0=
00000000 +0200
> @@ -24,14 +24,14 @@
>         const char *p =3D name;
>         char c;
> =20
> -       while (ct < 6) {
> +       while (ct < 7) {
> [..]
> +       while (ct < 7) {
>                 buf[ct] =3D ' ' << 1;
>                 ct++;
>         }
>=20
> I don't know what your problem was and what it should fix.
> But I see, that the while loop has a correct count for a callsign wit=
h
> a maximum of 6 letters (with "DL9SAU", starting with ct =3D 0, for
> processing "U", ct is =3D 5 and at the bottom, ct is incremented to 6=
=2E
> Then it is not < 6 anymore and the while loop is left. This is exactl=
y
> the expected behaviour.=20
>=20
> The next while loop fills the rest with shifted blanks for the "buf" =
in
> network-byte-order. buf is sizeof(7); the last position is buf[6] and
> contains the SSID. It needs not to be filled with ' ', beause a few l=
ines
> later we force it to be assigned, with:
> buf[6] =3D ((ssid + '0') << 1) & 0x1E;
>=20
> -> I've to reject that patch.
>=20
>> In ax25apps, application ax25ipd has been added a dynamic DNS option=
 and=20
>> more. Read ax25ipd History. =20
>=20
> It seems to implement Cathryn's threded-resolving-patch, and others.
> I've to look at it deeper. ax25ipd is a "monster".
>=20
>> In ax25tools, a bug in nrattach, prevented initializing NetRom devic=
es.
>=20
> Already fixed in CVS head:
> http://www.linux-ax25.org/cvsweb/ax25-tools/netrom/nrattach.c.diff?r1=
=3D1.3;r2=3D1.4;f=3Dh
>=20
> Revision 1.4: download - view: text, markup, annotated - select for d=
iffs
> Mon Nov 2 12:24:14 2009 UTC (5 months, 1 week ago) by dl9sau
> Branches: MAIN
> CVS tags: HEAD
> Diff to: previous 1.3: preferred, colored
> Changes since revision 1.3: +0 -2 lines
>=20
> 	Fix for a problem I introduced in 2005.
> 	Thanks to Bernard <f6bvp> for reporting this problem.
>=20
>> Patched rc2 source packages are available from here :
>>
>> http://f6bvp.free.fr/logiciels/ax25/libax25-0.0.12-rc2.patched_f6bvp=
=2Etar.bz2
>> http://f6bvp.free.fr/logiciels/ax25/ax25-apps-0.0.8-rc2.patched_f6bv=
p.tar.bz2
>> http://f6bvp.free.fr/logiciels/ax25/ax25-tools-0.0.10-rc2.patched_f6=
bvp.tar.bz2
>=20
> btw, your tar-balls contain directory mode 777. This may cause securi=
ty
> problems.
>=20
>> 73 de Bernard, f6bvp
>=20
> 73,
> 	- Thomas  dl9sau
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
