From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Can only connect to RMS gateway once
Date: Fri, 3 Jun 2016 08:52:16 -0700
Message-ID: <5751A7B0.3020606@trinnet.net>
References: <20160602124608.29163c27@brox.localnet>
 <5750C8E1.7050802@trinnet.net>
 <7B8C949E-EDBF-43F0-BB87-7BF874941737@osterried.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <7B8C949E-EDBF-43F0-BB87-7BF874941737@osterried.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Thomas Osterried <thomas@osterried.de>, Linux Hams <linux-hams@vger.kernel.org>
Cc: Basil Gunn <basil@pacabunga.com>, =?UTF-8?Q?Ralf_B=c3=a4chle_DL5RB?= <ralf@linux-mips.org>


Hey Thomas,

I followed up with Greg Kroah-Hartman who has been very helpful in the=20
past for some of my kernel contributions.  He had the following to say:

--
-------- Forwarded Message --------
Subject: Re: Fwd: Re: Can only connect to RMS gateway once - AX.25 stac=
k=20
issues in recent kernel versions..
Date: Fri, 3 Jun 2016 08:45:23 -0700
=46rom: Greg Kroah-Hartman <greg@com>
To: David Ranch <linux-hams@net>

On Fri, Jun 03, 2016 at 08:39:39AM -0700, David Ranch wrote:
 >
 > [Resend to move past your email bot]
 >
 > Hey Greg,
 >
 > I know you're a busy guy in the world of everything Linux but I was=20
curious
 > if you can help direct some resources (people time) towards the AX.2=
5=20
stack.
 > There are a few issues that have crept into the kernel here due to i=
t's
 > ongoing cleanup efforts and though patches have been offered, they=20
weren't
 > committed into Git.

I don't see where the patches were sent, do you have pointers to them?
What subsystem were they for? And why were they rejected?

And if you need/want help with this, please post on the driverdevel
mailing list (for the staging tree, the address is in the MAINTAINERS
file), there are lots of people there looking for things to help out
with.

thanks,

greg k-h
--

Can you find your previous patches and any other troubleshooting detail=
s=20
you've recorded (SMP issues, etc) put them into a easy to follow email?=
=20
  With that, I'd be happy to cheerlead this effort to Greg and the=20
driverdevel group to see if we can get some help here.

--David
KI6ZHD



On 06/03/2016 01:19 AM, Thomas Osterried wrote:
>
>> Am 03.06.2016 um 02:01 schrieb David Ranch <linux-hams@trinnet.net>:
>>
>>
>> Hey Basil,
>>
>> Good to hear from you.. hope all is well.
>>
>> Yes.. it's been reported and Thomas verified it but I haven't heard =
of any fixes yet ( I did send out a prod last month but no response)
>
> In another thread (Message-Id: <56FAD2CA.5060707@trinnet.net> you ans=
wered my question, that those machines are running with an smp-kernel.
> Have you tried to disable smp (in grub, boot the kernel with the cmdl=
ine option nosmp)?
> Did then the problem still occur?
>
> Those bugs are very hard to trace, because you cannot really provoke =
them; they occur suddenly.
>
> With kernel ax25 on smp machines I have discovered other severe bugs =
(ax25 data corruption), that also needs to be fixed.
>
> Imho, our greatest problem is that there too few kernel ax25 develope=
rs around in our ham community.
>
> In the meantime, I encourage to disable SMP to minimize the problems =
with kernel ax25.
>
>
> Also look at my posting Message-Id: <20160215140035.GF24276@x-berg.in=
-berlin.de> from 2016-02-15. There was no response on the list, and not=
hing got into the kernel
> (as far as I can see - my approach is to look at https://kernel.googl=
esource.com/pub/scm/linux/kernel/git/stable/linux-stable/+/master/drive=
rs/net/hamradio ; perhaps I'm wrong with that ).
>
> And on 2016-02-17 I asked for submitting my patch to mkiss.c that fix=
es a race condition that leads to kernel panic (!!!!): when the kernel =
ax25 stack sends data to the interface right after you plugged off your=
 usb-serial-adapter.
> It took me hours to discover, test and submit that, but nothing happe=
ns.
> (David, it was in my mail to you with Message-Id: <9E57F6D5-9BFC-4C64=
-B2E4-7C332C502D01@osterried.de> )
>
>
> Thus, those problems are discussed here year after year, again and ag=
ain, and periodically people spend time to develop fixes others have al=
ready done (but never made it into the mainline kernel).
>
> I'm very frustrated in that, and in a review of my past efforts I sim=
ply have to say now "sorry, I cannot help".
>
>
> vy 73,
> 	- Thomas  dl9sau
>
>
>> --David
>> KI6ZHD
>>
>>
>>
>> -------- Forwarded Message --------
>> Subject: 	Re: AX.25 / ax25d socket close issue on Ubuntu 14.04 but n=
ot on 12.04
>> Date: 	Tue, 29 Mar 2016 09:00:37 +0200
>> From: 	Thomas Osterried <thomas@de>
>> To: 	David Ranch <dranch@net>
>> CC: 	Ralf B=E4chle DL5RB <ralf@org>, Bernard, f6bvp <f6bvp@fr>
>>
>>
>>
>>> Am 28.03.2016 um 22:21 schrieb David Ranch <dranch@net>:
>>>
>>> Hey Ralf, Thomas, Bernard,
>>>
>>> I've been helping a user here who is running the LinuxRMS gateway o=
n his Ubuntu 14.04 machine and when the remote station terminates the s=
ession, it leaves an AX.25 session on his computer *forever*.. never ti=
mes out:
>>>
>>> Active AX.25 sockets
>>> Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
>>> WA7FPV-0   WA7FPV-10  ax0     LISTENING    001/003  0       0
>>>
>>> He built up an Ubuntu 12.04 machine with the same LinuxRMS/ax25d se=
rvice and this does NOT happen.  He then sent me the below strace.  Any=
 thoughts on where this issue is coming from?
>>
>> Hello David,
>>
>> just for a quick answer (I'm on journey): it's coming from a kernel =
bug in the ax25 part.
>> You already have Cc'ed Ralf <dl5rb>.
>> If I remember correctly, he spoke some weeks ago also about this iss=
ue.
>> I also know of those problems, which are very rare.
>>
>> My question is: does it happen on SMP (multiprocessor-machine)?
>>
>> vy 73,
>> 	- Thomas  dl9sau
>>
>>>
>>> --David
>>>
>>>
>>>
>>> -------- Forwarded Message --------
>>> Subject:	Re: AX.25 Help...
>>> Date:	Mon, 28 Mar 2016 12:52:25 -0700
>>> From:	Josh Gibbs <gibbsjj@com>
>>> To:	David Ranch <dranch@net>
>>>
>>> Confirmed that starting Direwolf on the Ubuntu 14 box with your scr=
ipt made no difference. Socket still hangs up. I connected to the rmsgw=
 process with strace, and then sent the bye command:
>>>
>>> select(5, [0 4], NULL, NULL, NULL)      =3D 1 (in [0])
>>> read(0, "b\r", 8192)                    =3D 2
>>> write(4, "b\r", 2)                      =3D 2
>>> read(0, 0x8058180, 8192)                =3D -1 EAGAIN (Resource tem=
porarily unavailable)
>>> select(5, [0 4], NULL, NULL, NULL)      =3D 1 (in [4])
>>> recv(4, "D", 1, MSG_PEEK|MSG_DONTWAIT)  =3D 1
>>> recv(4, "Disconnecting...\r", 8192, 0)  =3D 17
>>> write(1, "Disconnecting...\r", 17)      =3D 17
>>> recv(4, 0x8058180, 8192, 0)             =3D -1 EAGAIN (Resource tem=
porarily unavailable)
>>> select(5, [0 4], NULL, NULL, NULL)      =3D 1 (in [4])
>>> recv(4, "", 1, MSG_PEEK|MSG_DONTWAIT)   =3D 0
>>> time(NULL)                              =3D 1459193715
>>> send(3, "<134>Mar 28 12:35:15 rmsgw[1417]"..., 85, MSG_NOSIGNAL) =3D=
 85
>>> write(1, "; INFO: Connection closed by CMS"..., 51) =3D 51
>>> rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
>>> rt_sigaction(SIGCHLD, NULL, {SIG_IGN, [], 0}, 8) =3D 0
>>> nanosleep({1, 0}, 0xbfad3bac)           =3D 0
>>> rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
>>> close(4)                                =3D 0
>>> time(NULL)                              =3D 1459193716
>>> write(1, "; Sent: 81 Bytes / Received: 2 B"..., 61) =3D 61
>>> write(1, "; W7AUX de WA7FPV-10 SK\n", 24) =3D 24
>>> time(NULL)                              =3D 1459193716
>>> time(NULL)                              =3D 1459193716
>>> send(3, "<133>Mar 28 12:35:16 rmsgw[1417]"..., 84, MSG_NOSIGNAL) =3D=
 84
>>> close(4)                                =3D -1 EBADF (Bad file desc=
riptor)
>>> exit_group(0)                           =3D ?
>>> +++ exited with 0 +++
>>>
>>> I'm thinking that close(4) near the end is supposed to close the so=
cket, but is resulting in -1 EBADF (Bad file descriptor).
>>>
>>> I'm going to have a look in the code when I have more time to poke =
at this, but for now I at least have a working RMS Gateway on the Ubunt=
u 12 box! Appreciate all your help with this. I will let you know when =
I get to the root of it all, if you are interested!
>>>
>>> -Josh
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
