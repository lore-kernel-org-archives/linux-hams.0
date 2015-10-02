From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: Re: Force mkiss to reset the line discipline when serial device is
 removed
Date: Fri, 02 Oct 2015 15:48:12 +0200
Message-ID: <560E8B1C.9030209@eclis.ch>
References: <20151001073117.GA31401@linux-mips.org> <1443691088-30478-1-git-send-email-jc@eclis.ch> <560D65C7.30707@eclis.ch> <560DBA47.3040907@hurleysoftware.com> <560E40A1.7050002@eclis.ch> <97E87223-A3FF-476E-86F2-AE923D4AB955@osterried.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <97E87223-A3FF-476E-86F2-AE923D4AB955@osterried.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Thomas Osterried <thomas@osterried.de>
Cc: Peter Hurley <peter@hurleysoftware.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, David Ranch <dranch@trinnet.net>, =?windows-1252?Q?Ralf_B=E4chle_DL5RB?= <ralf@linux-mips.org>, linux-hams@trinnet.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org

Le 02. 10. 15 12:35, Thomas Osterried a =E9crit :
> Hello,
>
>
>> Am 02.10.2015 um 10:30 schrieb Jean-Christian de Rivaz <jc@eclis.ch>=
:
>>
>> Le 02. 10. 15 00:57, Peter Hurley a =E9crit :
>>> On 10/01/2015 12:56 PM, Jean-Christian de Rivaz wrote:
>>>> Hi Greg and Jiri,
>>>>
>>>> I try to fix a kernel panic bug related to the AX25 (and probably =
SLIP) line discipline when the corresponding serial device is removed [=
1]. I proposed some patches [2] [3] on the linux-hams mailing list but =
I think there raise more questions about how tty_ldisc_hangup() should =
work when a serial device is removed [4].
>>>>
>>>> I actually see the following options:
>>>>
>>>> a) Let the specific line discipline set the TTY_DRIVER_RESET_TERMI=
OS flag in tty->driver as in [2] but this is suspected bad practice [5]=
=2E
>>>>
>>>> b) Let the specific line discipline set the TTY_OTHER_CLOSED flag =
in tty and check it in tty_ldisc_hangup() as in [3].
> If I understand correctly, in current kernels TTY_OTHER_DONE is intro=
duced, instead of TTY_OTHER_CLOSED.
>
>>>> c) Let the specific line discipline set the TTY_LDISC_HALTED flag =
in tty and check it in tty_ldisc_hangup().
>>>>
>>>> d) Let the specific line discipline set a new flag for that purpos=
e, for example TTY_LDISC_RESET, and check it in tty_ldisc_hangup().
>>>>
>>>> e) Close the tty earlier so that tty_ldisc_reinit() is not even ca=
lled. Need some advise on how this should be done.
>>>>
>>>> f) That's all wrong, something other need to be changed.
>>>>
>>>> I would appreciate some comments from tty subsystem experts about =
this issue.
>>>>
>>>> [1] http://www.spinics.net/lists/linux-hams/msg03500.html
>> Hi Peter, thanks for your time,
>>
>>> The crash reported here appears to be related to how mkiss handles =
its netdev;
>>> maybe prematurely freeing the tx/rx buffers? I'd relook at how slip=
 handles
>>> netdev teardown.
>> Yes but this is a consequence of the fact that the ax0 interface was=
 re-opened uninitialized while the corresponding serial device is no lo=
nger connected to the system. I don=92t see any rational to create this=
 bogus interface: the serial device is gone.
> I also tried 6pack, and the traditional slip interface. The same thin=
g happens - device reappears.
>
> I don=92t think there=92s a good reason for this, because after reini=
tialization, the iface is down, ip address and routes over it have disa=
ppeard. Thus it=92s even not usable anymore as not-active-dummy-interfa=
ce for ip/routes.
>
> I=92ve not tested ppp and possible other line-based protocols - but I=
 assume they=92ve all the same issue, and nobody noticed before. Anyone=
 likes to track down ppp=92s behavior?
>
> Do we have a way to determine if the interface was re-initialized by =
the ldisc handler? Then we (and any other line based driver) could try =
to check in the .open call and decide what to do.
> But imho, it would always may cause problems when people write new dr=
ivers and oversee the not obvious situation where devices may reappear.=
 The default should be not to call open again.

=46ully agree on that.

> I also wonder why userspace processes like kissattach do not get a si=
gnal by the kernel, indicating that the filedescriptor is not valid any=
more.
> Who=92s job would it be to signal, the serial driver=92s (slip, ppp, =
mkiss, ..), or ldisc=92s?

It's a complete other problem, not kernel related. The safety of the=20
kernel cannot depend on a user application closing a file descriptor.=20
Even if the user application close his file descriptor, process=20
scheduling can make this delayed long enough to let's a packet reach th=
e=20
parasitic uninitialized interface and completely crash the system. This=
=20
will at best only reduce the race window but do nothing to fix the real=
=20
bug. That said, kissattach uses a while (1) { sleep(); } loop that can=20
be cheaply replaced by a single old select() waiting on the file=20
descriptor. My understanding is that after the the AX25 discipline is i=
n=20
place the only event that can happen is that the descriptor is to be=20
closed. I will test a kissattach patch for this.

AFAIK tty_ldisc_hangup() already signal EOF to the file descriptor owne=
r=20
with these lines:

         wake_up_interruptible_poll(&tty->write_wait, POLLOUT);
         wake_up_interruptible_poll(&tty->read_wait, POLLIN);


>>> I don't see a problem with the ACM tty/tty core side of this.
>>>
>>> At the time the hangup occurs, there is actually still an ACM tty d=
evice.
>> Not physically, sorry. The physical serial device was unplugged fron=
t the system (or in hardware forced reset in the case of my test), caus=
ing a USB disconnect. It's important to understand that the USB disconn=
ect has already occurred seconds before the crash. The fact that there =
is still an ACM tty structure in the kernel corresponding to nothing re=
al is the cause of the problem.
>>
>>> The line discipline is reinited as a security precaution to prevent=
 a previous
>>> session's data from being visible in the new session.
>> Pragmatically reinited to N_TTY is ok, this is in fact how my propos=
ed patches work. But reinited to N_AX25 while the serial device is no m=
ore have no sense at all and cause the crash when the new uninitialized=
 parasitic interface try to send a packet.
>>
>>>   The tty core does not know
>>> at the time the vhangup() occurs that the ACM driver plans to unreg=
ister the
>>> tty device.
>> That=92s the root problem: It must a least known that it must not ca=
ll mkiss_open().
> Or at least mkiss_open() must have a way to dectect that a re-open wa=
s initiated.
> But as said, I=92d prefer it would not happen, because otherwise it d=
epends on every serial protocol driver to implement it correctly.
>

=46ully agree again. There is absolutely no doubt that the N_AX25 line=20
discipline must not be open again when the serial device is removed. Th=
e=20
fact is that tty_ldisc_hangup() is actually a mandatory path and that i=
t=20
call tty_ldisc_reinit() if a line discipline exists for the tty (alway=20
true in this case). So there is at least the following options:

A) Let's tty_ldisc_hangup() call tty_ldisc_reinit() but with N_TTY sinc=
e=20
the existing code already make that possible. This is how my patches=20
work. Only have to agree on the condition/flag to be used. My patch rel=
y=20
on code in the line discipline driver, but something more cleaver could=
=20
maybe done.

B) Same as A) but make the corresponding serial driver responsible to=20
set the TTY_DRIVER_RESET_TERMIOS flag in case the device is removed,=20
since the existing code handle that case. Unless some generic code in=20
the serial device layer can do that, this imply to modify all serial=20
drivers.

C) Modify tty_ldisc_hangup() to call tty_ldisc_close() in that case but=
=20
still have to agree on the condition.

The raise to me this question: when an application still have an open=20
file descriptor on a removed serial device, how long the kernel tty=20
structure is supposed to live ?

1) Only until the serial device removal, the file descriptor is an othe=
r=20
structure.

2) Until the application close the file descriptor, even if it's days=20
after the serial device has been removed.

>> That's the bug that must be fixed. Or maybe the option e) fix must b=
e developed.
>>
>>> Don't do any of the things you suggest above.
>>>
>> Can I ask what did you suggest to solve the problem ? The bug is rea=
l, causing a kernel panic and complete crash of the system, requiring a=
 hardware reset to reboot.
>>
>> Best Regards,
>> Jean-Christian de Rivaz
> vy 73,
> 	- Thomas  dl9sau

Jean-Christian
