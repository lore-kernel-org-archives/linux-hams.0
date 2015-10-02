From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Force mkiss to reset the line discipline when serial device is removed
Date: Fri, 2 Oct 2015 12:35:17 +0200
Message-ID: <97E87223-A3FF-476E-86F2-AE923D4AB955@osterried.de>
References: <20151001073117.GA31401@linux-mips.org> <1443691088-30478-1-git-send-email-jc@eclis.ch> <560D65C7.30707@eclis.ch> <560DBA47.3040907@hurleysoftware.com> <560E40A1.7050002@eclis.ch>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <560E40A1.7050002@eclis.ch>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jean-Christian de Rivaz <jc@eclis.ch>
Cc: Peter Hurley <peter@hurleysoftware.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, David Ranch <dranch@trinnet.net>, =?utf-8?Q?Ralf_B=C3=A4chle_DL5RB?= <ralf@linux-mips.org>, linux-hams@trinnet.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,


> Am 02.10.2015 um 10:30 schrieb Jean-Christian de Rivaz <jc@eclis.ch>:
>=20
> Le 02. 10. 15 00:57, Peter Hurley a =C3=A9crit :
>> On 10/01/2015 12:56 PM, Jean-Christian de Rivaz wrote:
>>> Hi Greg and Jiri,
>>>=20
>>> I try to fix a kernel panic bug related to the AX25 (and probably S=
LIP) line discipline when the corresponding serial device is removed [1=
]. I proposed some patches [2] [3] on the linux-hams mailing list but I=
 think there raise more questions about how tty_ldisc_hangup() should w=
ork when a serial device is removed [4].
>>>=20
>>> I actually see the following options:
>>>=20
>>> a) Let the specific line discipline set the TTY_DRIVER_RESET_TERMIO=
S flag in tty->driver as in [2] but this is suspected bad practice [5].
>>>=20
>>> b) Let the specific line discipline set the TTY_OTHER_CLOSED flag i=
n tty and check it in tty_ldisc_hangup() as in [3].

If I understand correctly, in current kernels TTY_OTHER_DONE is introdu=
ced, instead of TTY_OTHER_CLOSED.

>>> c) Let the specific line discipline set the TTY_LDISC_HALTED flag i=
n tty and check it in tty_ldisc_hangup().
>>>=20
>>> d) Let the specific line discipline set a new flag for that purpose=
, for example TTY_LDISC_RESET, and check it in tty_ldisc_hangup().
>>>=20
>>> e) Close the tty earlier so that tty_ldisc_reinit() is not even cal=
led. Need some advise on how this should be done.
>>>=20
>>> f) That's all wrong, something other need to be changed.
>>>=20
>>> I would appreciate some comments from tty subsystem experts about t=
his issue.
>>>=20
>>> [1] http://www.spinics.net/lists/linux-hams/msg03500.html
>=20
> Hi Peter, thanks for your time,
>=20
>> The crash reported here appears to be related to how mkiss handles i=
ts netdev;
>> maybe prematurely freeing the tx/rx buffers? I'd relook at how slip =
handles
>> netdev teardown.
>=20
> Yes but this is a consequence of the fact that the ax0 interface was =
re-opened uninitialized while the corresponding serial device is no lon=
ger connected to the system. I don=E2=80=99t see any rational to create=
 this bogus interface: the serial device is gone.

I also tried 6pack, and the traditional slip interface. The same thing =
happens - device reappears.

I don=E2=80=99t think there=E2=80=99s a good reason for this, because a=
fter reinitialization, the iface is down, ip address and routes over it=
 have disappeard. Thus it=E2=80=99s even not usable anymore as not-acti=
ve-dummy-interface for ip/routes.

I=E2=80=99ve not tested ppp and possible other line-based protocols - b=
ut I assume they=E2=80=99ve all the same issue, and nobody noticed befo=
re. Anyone likes to track down ppp=E2=80=99s behavior?

Do we have a way to determine if the interface was re-initialized by th=
e ldisc handler? Then we (and any other line based driver) could try to=
 check in the .open call and decide what to do.
But imho, it would always may cause problems when people write new driv=
ers and oversee the not obvious situation where devices may reappear. T=
he default should be not to call open again.

I also wonder why userspace processes like kissattach do not get a sign=
al by the kernel, indicating that the filedescriptor is not valid anymo=
re.
Who=E2=80=99s job would it be to signal, the serial driver=E2=80=99s (s=
lip, ppp, mkiss, ..), or ldisc=E2=80=99s?

>> I don't see a problem with the ACM tty/tty core side of this.
>>=20
>> At the time the hangup occurs, there is actually still an ACM tty de=
vice.
>=20
> Not physically, sorry. The physical serial device was unplugged front=
 the system (or in hardware forced reset in the case of my test), causi=
ng a USB disconnect. It's important to understand that the USB disconne=
ct has already occurred seconds before the crash. The fact that there i=
s still an ACM tty structure in the kernel corresponding to nothing rea=
l is the cause of the problem.
>=20
>> The line discipline is reinited as a security precaution to prevent =
a previous
>> session's data from being visible in the new session.
>=20
> Pragmatically reinited to N_TTY is ok, this is in fact how my propose=
d patches work. But reinited to N_AX25 while the serial device is no mo=
re have no sense at all and cause the crash when the new uninitialized =
parasitic interface try to send a packet.
>=20
>>  The tty core does not know
>> at the time the vhangup() occurs that the ACM driver plans to unregi=
ster the
>> tty device.
>=20
> That=E2=80=99s the root problem: It must a least known that it must n=
ot call mkiss_open().

Or at least mkiss_open() must have a way to dectect that a re-open was =
initiated.
But as said, I=E2=80=99d prefer it would not happen, because otherwise =
it depends on every serial protocol driver to implement it correctly.

> That's the bug that must be fixed. Or maybe the option e) fix must be=
 developed.
>=20
>> Don't do any of the things you suggest above.
>>=20
>=20
> Can I ask what did you suggest to solve the problem ? The bug is real=
, causing a kernel panic and complete crash of the system, requiring a =
hardware reset to reboot.
>=20
> Best Regards,
> Jean-Christian de Rivaz

vy 73,
	- Thomas  dl9sau--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
