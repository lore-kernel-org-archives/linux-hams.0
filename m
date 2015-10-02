From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: Re: Force mkiss to reset the line discipline when serial device is
 removed
Date: Fri, 02 Oct 2015 10:30:25 +0200
Message-ID: <560E40A1.7050002@eclis.ch>
References: <20151001073117.GA31401@linux-mips.org> <1443691088-30478-1-git-send-email-jc@eclis.ch> <560D65C7.30707@eclis.ch> <560DBA47.3040907@hurleysoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <560DBA47.3040907@hurleysoftware.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Thomas Osterried <thomas@osterried.de>, David Ranch <dranch@trinnet.net>, Ralf Baechle DL5RB <ralf@linux-mips.org>, linux-hams@trinnet.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org

Le 02. 10. 15 00:57, Peter Hurley a =C3=A9crit :
> On 10/01/2015 12:56 PM, Jean-Christian de Rivaz wrote:
>> Hi Greg and Jiri,
>>
>> I try to fix a kernel panic bug related to the AX25 (and probably SL=
IP) line discipline when the corresponding serial device is removed [1]=
=2E I proposed some patches [2] [3] on the linux-hams mailing list but =
I think there raise more questions about how tty_ldisc_hangup() should =
work when a serial device is removed [4].
>>
>> I actually see the following options:
>>
>> a) Let the specific line discipline set the TTY_DRIVER_RESET_TERMIOS=
 flag in tty->driver as in [2] but this is suspected bad practice [5].
>>
>> b) Let the specific line discipline set the TTY_OTHER_CLOSED flag in=
 tty and check it in tty_ldisc_hangup() as in [3].
>>
>> c) Let the specific line discipline set the TTY_LDISC_HALTED flag in=
 tty and check it in tty_ldisc_hangup().
>>
>> d) Let the specific line discipline set a new flag for that purpose,=
 for example TTY_LDISC_RESET, and check it in tty_ldisc_hangup().
>>
>> e) Close the tty earlier so that tty_ldisc_reinit() is not even call=
ed. Need some advise on how this should be done.
>>
>> f) That's all wrong, something other need to be changed.
>>
>> I would appreciate some comments from tty subsystem experts about th=
is issue.
>>
>> [1] http://www.spinics.net/lists/linux-hams/msg03500.html

Hi Peter, thanks for your time,

> The crash reported here appears to be related to how mkiss handles it=
s netdev;
> maybe prematurely freeing the tx/rx buffers? I'd relook at how slip h=
andles
> netdev teardown.

Yes but this is a consequence of the fact that the ax0 interface was=20
re-opened uninitialized while the corresponding serial device is no=20
longer connected to the system. I don't see any rational to create this=
=20
bogus interface: the serial device is gone.

> I don't see a problem with the ACM tty/tty core side of this.
>
> At the time the hangup occurs, there is actually still an ACM tty dev=
ice.

Not physically, sorry. The physical serial device was unplugged front=20
the system (or in hardware forced reset in the case of my test), causin=
g=20
a USB disconnect. It's important to understand that the USB disconnect=20
has already occurred seconds before the crash. The fact that there is=20
still an ACM tty structure in the kernel corresponding to nothing real=20
is the cause of the problem.

> The line discipline is reinited as a security precaution to prevent a=
 previous
> session's data from being visible in the new session.

Pragmatically reinited to N_TTY is ok, this is in fact how my proposed=20
patches work. But reinited to N_AX25 while the serial device is no more=
=20
have no sense at all and cause the crash when the new uninitialized=20
parasitic interface try to send a packet.

>   The tty core does not know
> at the time the vhangup() occurs that the ACM driver plans to unregis=
ter the
> tty device.

That's the root problem: It must a least known that it must not call=20
mkiss_open(). That's the bug that must be fixed. Or maybe the option e)=
=20
fix must be developed.

> Don't do any of the things you suggest above.
>

Can I ask what did you suggest to solve the problem ? The bug is real,=20
causing a kernel panic and complete crash of the system, requiring a=20
hardware reset to reboot.

Best Regards,
Jean-Christian de Rivaz

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
