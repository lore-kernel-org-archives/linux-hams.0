From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: [PATCH] Adding netstat 1.70 ROSE protocol support
Date: Sun, 28 Nov 2010 19:57:48 +0100
Message-ID: <4CF2A62C.9050006@upmc.fr>
References: <201007270938.o6R9ckFR023586@unicorn.berlios.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <201007270938.o6R9ckFR023586@unicorn.berlios.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: bernd-10@eckenfels.net
Cc: net-tools@lina.inka.de, linux-hams <linux-hams@vger.kernel.org>, Bernard Pidoux <bpidoux@free.fr>

Hi Bernd,

Although I submitted an update for netstat supporting AMPR rose protoco=
le,
netstat 1.70 has been commited in Berlios.de CVS repository without=20
including it.

The following patch has been updated against the present net-tools CVS
and includes a safer code for reading and displaying rose state.

I hope it will be included in netstat CVS as this is a very usefull too=
l
to display AMPR proc files such as AX.25, NetRom and Rose.

http://f6bvp.free.fr/logiciels/netstat/netstat-CVS-1.70.patch

Bernard Pidoux
f6bvp
=46unding President AMSAT France

Note for hamradio operators :
net-tools can be downloaded from CVS by issuing the following requests =
:

*cvs -d:pserver:anonymous@cvs.net-tools.berlios.de:/cvsroot/net-tools l=
ogin*

Type <return> when asked for a password.
*
cvs -z3 -d:pserver:anonymous@cvs.net-tools.berlios.de:/cvsroot/net-tool=
s=20
co net-tools*

This will create net-tools sub directory with all net-tools modules=20
including netstat.

Apply the above patch after downloading the file :

patch -p0 < netstat-CVS-1.70.patch

A typical command could be :

netstat --rose
or
netstat --route --rose

Same for ax25 or netrom




Le 16/08/2010 18:00, Bernd Eckenfels a =E9crit :
> On Mon, Aug 16, 2010 at 04:01:49PM +0200, Bernard F6BVP wrote:
>> The present patch corrects this bug by initializing rose_state[]
>> correctly according to linux/include/net/rose.h
> Thanks, can you please also add a "unknown state" option in case the=20
> kernel
> adds new states?  Will integrate that to upstream CVS later this week=
=2E
>
> Greetings
> Bernd


--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
