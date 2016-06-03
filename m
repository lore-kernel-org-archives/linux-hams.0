From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Can only connect to RMS gateway once
Date: Thu, 2 Jun 2016 17:01:37 -0700
Message-ID: <5750C8E1.7050802@trinnet.net>
References: <20160602124608.29163c27@brox.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160602124608.29163c27@brox.localnet>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Basil Gunn <basil@pacabunga.com>, Linux Hams <linux-hams@vger.kernel.org>
Cc: Thomas Osterried <thomas@osterried.de>


Hey Basil,

Good to hear from you.. hope all is well.

Yes.. it's been reported and Thomas verified it but I haven't heard of=20
any fixes yet ( I did send out a prod last month but no response)

--David
KI6ZHD



-------- Forwarded Message --------
Subject: 	Re: AX.25 / ax25d socket close issue on Ubuntu 14.04 but not=20
on 12.04
Date: 	Tue, 29 Mar 2016 09:00:37 +0200
=46rom: 	Thomas Osterried <thomas@de>
To: 	David Ranch <dranch@net>
CC: 	Ralf B=E4chle DL5RB <ralf@org>, Bernard, f6bvp <f6bvp@fr>



> Am 28.03.2016 um 22:21 schrieb David Ranch <dranch@net>:
>
> Hey Ralf, Thomas, Bernard,
>
> I've been helping a user here who is running the LinuxRMS gateway on =
his Ubuntu 14.04 machine and when the remote station terminates the ses=
sion, it leaves an AX.25 session on his computer *forever*.. never time=
s out:
>
> Active AX.25 sockets
> Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
> WA7FPV-0   WA7FPV-10  ax0     LISTENING    001/003  0       0
>
> He built up an Ubuntu 12.04 machine with the same LinuxRMS/ax25d serv=
ice and this does NOT happen.  He then sent me the below strace.  Any t=
houghts on where this issue is coming from?

Hello David,

just for a quick answer (I'm on journey): it's coming from a kernel bug=
 in the ax25 part.
You already have Cc'ed Ralf <dl5rb>.
If I remember correctly, he spoke some weeks ago also about this issue.
I also know of those problems, which are very rare.

My question is: does it happen on SMP (multiprocessor-machine)?

vy 73,
	- Thomas  dl9sau

>
> --David
>
>
>
> -------- Forwarded Message --------
> Subject:	Re: AX.25 Help...
> Date:	Mon, 28 Mar 2016 12:52:25 -0700
> From:	Josh Gibbs <gibbsjj@com>
> To:	David Ranch <dranch@net>
>
> Confirmed that starting Direwolf on the Ubuntu 14 box with your scrip=
t made no difference. Socket still hangs up. I connected to the rmsgw p=
rocess with strace, and then sent the bye command:
>
> select(5, [0 4], NULL, NULL, NULL)      =3D 1 (in [0])
> read(0, "b\r", 8192)                    =3D 2
> write(4, "b\r", 2)                      =3D 2
> read(0, 0x8058180, 8192)                =3D -1 EAGAIN (Resource tempo=
rarily unavailable)
> select(5, [0 4], NULL, NULL, NULL)      =3D 1 (in [4])
> recv(4, "D", 1, MSG_PEEK|MSG_DONTWAIT)  =3D 1
> recv(4, "Disconnecting...\r", 8192, 0)  =3D 17
> write(1, "Disconnecting...\r", 17)      =3D 17
> recv(4, 0x8058180, 8192, 0)             =3D -1 EAGAIN (Resource tempo=
rarily unavailable)
> select(5, [0 4], NULL, NULL, NULL)      =3D 1 (in [4])
> recv(4, "", 1, MSG_PEEK|MSG_DONTWAIT)   =3D 0
> time(NULL)                              =3D 1459193715
> send(3, "<134>Mar 28 12:35:15 rmsgw[1417]"..., 85, MSG_NOSIGNAL) =3D =
85
> write(1, "; INFO: Connection closed by CMS"..., 51) =3D 51
> rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
> rt_sigaction(SIGCHLD, NULL, {SIG_IGN, [], 0}, 8) =3D 0
> nanosleep({1, 0}, 0xbfad3bac)           =3D 0
> rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
> close(4)                                =3D 0
> time(NULL)                              =3D 1459193716
> write(1, "; Sent: 81 Bytes / Received: 2 B"..., 61) =3D 61
> write(1, "; W7AUX de WA7FPV-10 SK\n", 24) =3D 24
> time(NULL)                              =3D 1459193716
> time(NULL)                              =3D 1459193716
> send(3, "<133>Mar 28 12:35:16 rmsgw[1417]"..., 84, MSG_NOSIGNAL) =3D =
84
> close(4)                                =3D -1 EBADF (Bad file descri=
ptor)
> exit_group(0)                           =3D ?
> +++ exited with 0 +++
>
> I'm thinking that close(4) near the end is supposed to close the sock=
et, but is resulting in -1 EBADF (Bad file descriptor).
>
> I'm going to have a look in the code when I have more time to poke at=
 this, but for now I at least have a working RMS Gateway on the Ubuntu =
12 box! Appreciate all your help with this. I will let you know when I =
get to the root of it all, if you are interested!
>
> -Josh
>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
