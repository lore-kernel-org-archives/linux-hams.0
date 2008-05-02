From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: FBB 7.04p with xfbbX X11 client for FBB working
Date: Fri, 02 May 2008 10:45:32 +0200
Message-ID: <481AD4AC.5060301@ccr.jussieu.fr>
References: <47DD3BA9.3050400@ccr.jussieu.fr> <4819B44F.4030209@aa6qn.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4819B44F.4030209@aa6qn.sytes.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: AA6QN <aa6qn@aa6qn.sytes.net>
Cc: linux-hams <linux-hams@vger.kernel.org>, Hans-Juergen Barthen <dl5di@gmx.de>

Hi John,

I suggest you keep on using the version that works for you.
The problem with AX25 libs, apps and tools is that there is no more=20
"official" versions as the interest for packet radio fell down during=20
the last years.

There is no more official repository for AX25 packages.
Ralf's DL5RB page
http://sourceforge.net/projects/hams
points to obsolete sourceforge address since 2002/09/08 !
However the new address
http://sourceforge.net/projects/ax25/
has an obsolete libax25 source
     *  0.0.10 released with security fix    2002-03-28

Here is another sourceforge repository address
http://sourceforge.net/project/showfiles.php?group_id=3D24545
from where I downloaded my original versions that I originaly slightly
patched to make them work with 2.6 kernel.

If new official versions were to be released it should have been=20
approved at least by a team of users in order to verify that the new=20
versions :

- remove a known bug
- do not create a new bug
- improves the functionnality of the software.

Personnaly I could not compile libax25-0.0.13.6 while my version 11.4=20
has been installed at least on two dozens of stations with different=20
distro and kernel versions. The same for my versions of ax25-tools and =
apps.

I only removed bugs from the source in order to keep it compatible.
Thus, there is no change into syntaxe and usage of these AX25 libraries=
=20
applications or tools.
When times come, and if interest is growing again, we will probably hav=
e=20
chance to add new features into these packages if necessary.

Most of my present efforts are aimed at removing bugs from Linux kernel=
=20
ax25 and rose modules.

With 2.6.24.4 we have a pretty stable version.
Kernel 2.6.26 will certainly be even more stable, incorporating a few=20
bug corrections too.

You can find here some patchs for kernel 2.6.24.4 and 2.6.25.
http://f6bvp.free.fr/logiciels/kernel-2.6-patch/

Concerning LinFBB 7.04p, although it works, there are still some proble=
ms.
=46orwarding does not close some sockets when used via rose interface.

More important, LinFBB does not work at all with SMP kernels=20
(Simultaneous Multi Processing). The bad thing is that many distro are=20
now installing such SMP kernels by default. So, people have to recompil=
e=20
it without this option.
I received some reports about /proc/sys/net/ax25 missing with the last=20
Ubuntu distro.

73 de Bernard, f6bvp


AA6QN a =E9crit :
> Bernard Pidoux wrote:
> ------------------
> First, I wish to say thank you for all your hard work! I have been=20
> running FBB for many years now and really like the software.
>=20
> Recently, I have been met with a couple of challenges. When I upgrade=
d=20
> the libax25 to 13-6, I lost my FBB loopback interfaces. Guess I am ol=
d=20
> school and during the ax25 startup I defined two loopback interfaces:
>=20
> # /etc/conf.d/rc.ax25 Create Loopback ports
> /usr/local/sbin/kissnetd /dev/ptya3 /dev/ptya4 &
> sleep 2
> /usr/local/sbin/kissattach -l -m 256 /dev/ttya3 ax3 44.8.0.112
> /usr/local/sbin/kissattach -l -m 256 /dev/ttya4 ax4 44.8.0.112
> route del -net 44.0.0.0/8 ax3
> route del -net 44.0.0.0/8 ax4
>=20
> # /etc/ax25/axports
> #  Name Callsign        speed           paclen  window  description
> ax0     AA6QN-9         115200          256     7       AXIP Link
> ax1     AA6QN-12        9600            256     1       1200 bps Port=
 A=20
> DE (pending)
> ax2     AA6QN-11        9600            256     2       9600 bps Port=
 B=20
> DE 439.050 MHz
> ax3     LOOP1           9600            256     4       Loopback 1
> ax4     LOOP2           9600            256     4       Loopback 2
>=20
> Then in /usr/local/etc/ax25/fbb/port.sys where-as ax4 is the loopback
>=20
> #TNC NbCh Com MultCh Pacln Maxfr NbFwd MxBloc M/P-Fwd Mode  Freq
>  0   0    0   0         0  0     0      0     00/01   ----  File-fwd.
>  1   4    1   ax1     250  1     2     10     10/60   XUWY pending
>  2   4    1   ax2     250  1     2     10     20/60   XUWY 439.050
>  3   4    1   ax0     250  2     2     10     30/30   XUWY ax0
>  4   4    1   ax4     250  4     2     10     30/60   XUWY ax4
>  5   2    1   netbbs  236  1     1     10     30/30   XUWY netrom
>  6   2    2   0       250  2     1     10      0/60   TUWY telnet
> #
>=20
> This all works great with libax25-0.0.11-4 but not libax25-0.0.13-6
> What did I miss? is there a new way to link FBB to the AX25 resources=
?
>=20
> I also tried to update to ax25-tools-0.0.9-3 but mkiss did not load m=
y=20
> dual port tnc stating it could not find the CALL. Same axport as abov=
e=20
> with ax1 and ax2 being the dual ported tnc. ax25-tools-0.0.8.2 does w=
ork:
>=20
> #/etc/conf.d/rc.ax25# Attach Dual TNC with MKISS COM2
> /usr/local/sbin/mkiss -s 9600 /dev/ttyS1 /dev/ptya0 /dev/ptya1
> sleep 2
> /usr/local/sbin/kissattach -l -m 256 /dev/ttya0 ax1 44.8.0.112
> /usr/local/sbin/kissattach -l -m 256 /dev/ttya1 ax2 44.8.0.112
> route del -net 44.0.0.0/8 ax1
> route del -net 44.0.0.0/8 ax2
> kissparms -p ax1 -t 30 -s 100 -r 63
> kissparms -p ax2 -t 10 -s 100 -r 63
>=20
>=20
> Once again, did I miss some changes in the configuration? The install=
=20
> notes were rather vague on syntax changes.
>=20
> Very best regards, John Feist AA6QN
>=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
