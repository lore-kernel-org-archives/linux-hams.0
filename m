From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Can only connect to RMS gateway once
Date: Fri, 3 Jun 2016 10:19:56 +0200
Message-ID: <7B8C949E-EDBF-43F0-BB87-7BF874941737@osterried.de>
References: <20160602124608.29163c27@brox.localnet> <5750C8E1.7050802@trinnet.net>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5750C8E1.7050802@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Ranch <linux-hams@trinnet.net>
Cc: Basil Gunn <basil@pacabunga.com>, Linux Hams <linux-hams@vger.kernel.org>, =?windows-1252?Q?Ralf_B=E4chle_DL5RB?= <ralf@linux-mips.org>


> Am 03.06.2016 um 02:01 schrieb David Ranch <linux-hams@trinnet.net>:
>=20
>=20
> Hey Basil,
>=20
> Good to hear from you.. hope all is well.
>=20
> Yes.. it's been reported and Thomas verified it but I haven't heard o=
f any fixes yet ( I did send out a prod last month but no response)

In another thread (Message-Id: <56FAD2CA.5060707@trinnet.net> you answe=
red my question, that those machines are running with an smp-kernel.
Have you tried to disable smp (in grub, boot the kernel with the cmdlin=
e option nosmp)?
Did then the problem still occur?

Those bugs are very hard to trace, because you cannot really provoke th=
em; they occur suddenly.

With kernel ax25 on smp machines I have discovered other severe bugs (a=
x25 data corruption), that also needs to be fixed.

Imho, our greatest problem is that there too few kernel ax25 developers=
 around in our ham community.

In the meantime, I encourage to disable SMP to minimize the problems wi=
th kernel ax25.


Also look at my posting Message-Id: <20160215140035.GF24276@x-berg.in-b=
erlin.de> from 2016-02-15. There was no response on the list, and nothi=
ng got into the kernel
(as far as I can see - my approach is to look at https://kernel.googles=
ource.com/pub/scm/linux/kernel/git/stable/linux-stable/+/master/drivers=
/net/hamradio ; perhaps I'm wrong with that ).

And on 2016-02-17 I asked for submitting my patch to mkiss.c that fixes=
 a race condition that leads to kernel panic (!!!!): when the kernel ax=
25 stack sends data to the interface right after you plugged off your u=
sb-serial-adapter.
It took me hours to discover, test and submit that, but nothing happens=
=2E
(David, it was in my mail to you with Message-Id: <9E57F6D5-9BFC-4C64-B=
2E4-7C332C502D01@osterried.de> )


Thus, those problems are discussed here year after year, again and agai=
n, and periodically people spend time to develop fixes others have alre=
ady done (but never made it into the mainline kernel).

I'm very frustrated in that, and in a review of my past efforts I simpl=
y have to say now "sorry, I cannot help".


vy 73,
	- Thomas  dl9sau


> --David
> KI6ZHD
>=20
>=20
>=20
> -------- Forwarded Message --------
> Subject: 	Re: AX.25 / ax25d socket close issue on Ubuntu 14.04 but no=
t on 12.04
> Date: 	Tue, 29 Mar 2016 09:00:37 +0200
> From: 	Thomas Osterried <thomas@de>
> To: 	David Ranch <dranch@net>
> CC: 	Ralf B=E4chle DL5RB <ralf@org>, Bernard, f6bvp <f6bvp@fr>
>=20
>=20
>=20
>> Am 28.03.2016 um 22:21 schrieb David Ranch <dranch@net>:
>>=20
>> Hey Ralf, Thomas, Bernard,
>>=20
>> I've been helping a user here who is running the LinuxRMS gateway on=
 his Ubuntu 14.04 machine and when the remote station terminates the se=
ssion, it leaves an AX.25 session on his computer *forever*.. never tim=
es out:
>>=20
>> Active AX.25 sockets
>> Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
>> WA7FPV-0   WA7FPV-10  ax0     LISTENING    001/003  0       0
>>=20
>> He built up an Ubuntu 12.04 machine with the same LinuxRMS/ax25d ser=
vice and this does NOT happen.  He then sent me the below strace.  Any =
thoughts on where this issue is coming from?
>=20
> Hello David,
>=20
> just for a quick answer (I'm on journey): it's coming from a kernel b=
ug in the ax25 part.
> You already have Cc'ed Ralf <dl5rb>.
> If I remember correctly, he spoke some weeks ago also about this issu=
e.
> I also know of those problems, which are very rare.
>=20
> My question is: does it happen on SMP (multiprocessor-machine)?
>=20
> vy 73,
> 	- Thomas  dl9sau
>=20
>>=20
>> --David
>>=20
>>=20
>>=20
>> -------- Forwarded Message --------
>> Subject:	Re: AX.25 Help...
>> Date:	Mon, 28 Mar 2016 12:52:25 -0700
>> From:	Josh Gibbs <gibbsjj@com>
>> To:	David Ranch <dranch@net>
>>=20
>> Confirmed that starting Direwolf on the Ubuntu 14 box with your scri=
pt made no difference. Socket still hangs up. I connected to the rmsgw =
process with strace, and then sent the bye command:
>>=20
>> select(5, [0 4], NULL, NULL, NULL)      =3D 1 (in [0])
>> read(0, "b\r", 8192)                    =3D 2
>> write(4, "b\r", 2)                      =3D 2
>> read(0, 0x8058180, 8192)                =3D -1 EAGAIN (Resource temp=
orarily unavailable)
>> select(5, [0 4], NULL, NULL, NULL)      =3D 1 (in [4])
>> recv(4, "D", 1, MSG_PEEK|MSG_DONTWAIT)  =3D 1
>> recv(4, "Disconnecting...\r", 8192, 0)  =3D 17
>> write(1, "Disconnecting...\r", 17)      =3D 17
>> recv(4, 0x8058180, 8192, 0)             =3D -1 EAGAIN (Resource temp=
orarily unavailable)
>> select(5, [0 4], NULL, NULL, NULL)      =3D 1 (in [4])
>> recv(4, "", 1, MSG_PEEK|MSG_DONTWAIT)   =3D 0
>> time(NULL)                              =3D 1459193715
>> send(3, "<134>Mar 28 12:35:15 rmsgw[1417]"..., 85, MSG_NOSIGNAL) =3D=
 85
>> write(1, "; INFO: Connection closed by CMS"..., 51) =3D 51
>> rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
>> rt_sigaction(SIGCHLD, NULL, {SIG_IGN, [], 0}, 8) =3D 0
>> nanosleep({1, 0}, 0xbfad3bac)           =3D 0
>> rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
>> close(4)                                =3D 0
>> time(NULL)                              =3D 1459193716
>> write(1, "; Sent: 81 Bytes / Received: 2 B"..., 61) =3D 61
>> write(1, "; W7AUX de WA7FPV-10 SK\n", 24) =3D 24
>> time(NULL)                              =3D 1459193716
>> time(NULL)                              =3D 1459193716
>> send(3, "<133>Mar 28 12:35:16 rmsgw[1417]"..., 84, MSG_NOSIGNAL) =3D=
 84
>> close(4)                                =3D -1 EBADF (Bad file descr=
iptor)
>> exit_group(0)                           =3D ?
>> +++ exited with 0 +++
>>=20
>> I'm thinking that close(4) near the end is supposed to close the soc=
ket, but is resulting in -1 EBADF (Bad file descriptor).
>>=20
>> I'm going to have a look in the code when I have more time to poke a=
t this, but for now I at least have a working RMS Gateway on the Ubuntu=
 12 box! Appreciate all your help with this. I will let you know when I=
 get to the root of it all, if you are interested!
>>=20
>> -Josh
>>=20
>>=20
>=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
