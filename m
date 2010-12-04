From: f6bvp <f6bvp@free.fr>
Subject: Re: Patch improving ROSE routing
Date: Sat, 04 Dec 2010 18:49:53 +0100
Message-ID: <4CFA7F41.7070505@free.fr>
References: <4CEEDE41.8000001@free.fr> <4CF6B200.1060509@embarqmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CF6B200.1060509@embarqmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: C Schuman <k4gbb1@embarqmail.com>
Cc: Ray Wells <vk2tv@exemail.com.au>, Bob Tenty <bobtenty@gmail.com>, Jerry DeLong <KD4YAL@tampabay.rr.com>, List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>, linux-hams <linux-hams@vger.kernel.org>

Hi,

I am presently hunting a bug in fpacwpd that makes this server crash=20
regularly.
I think I am not far from the goal as I found a SIGPIPE signal that is=20
occuring when
fpacwpd cannot reach a destination node. This signal was not handled by=
=20
the server
and this could explain why WP data base is not available from time to=20
time inside
fpacnode showing -1 instead of the number of nodes and fpacnode not=20
being able to
connect a remote node.
Continuous testing are being performed locally.
If the results are positive, I will soon release fpac327.14-pre30 that=20
could become
fpac327.14 after validation by you all.

On my list are a few other bugs in Linux rose module, ax25ipd, FPAC and=
=20
BBS softwares.
This number is decreasing regularly, with some valuable help from Cathr=
yn.

I recently corrected a bug in "nestat", a usefull tool from net-tools.=20
When I patched it
to include ROSE handling, I made a small error that made it crash from=20
time to time.
You can download netstat from CVS and apply the new patch as explained=20
here :

http://rose.fpac.free.fr/MINI-HOWTO/#s103

73 de Bernard, f6bvp


Le 01/12/2010 21:37, C Schuman a =E9crit :
> Bernard
> Either the AxUDP ports are working better or the ROSE patch has made =
a=20
> *HUGE* improvement.
> I installed the patch on approx half of our Servers.
> In Every case connectivity has improved and connections go thru at=20
> warp speed.
>
> <<Charley>>
>      k4gbb
>

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
