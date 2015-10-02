From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: Re: Force mkiss to reset the line discipline when serial device is
 removed
Date: Fri, 02 Oct 2015 19:25:27 +0200
Message-ID: <560EBE07.70801@eclis.ch>
References: <20151001073117.GA31401@linux-mips.org> <1443691088-30478-1-git-send-email-jc@eclis.ch> <560D65C7.30707@eclis.ch> <560DBA47.3040907@hurleysoftware.com> <560E40A1.7050002@eclis.ch> <97E87223-A3FF-476E-86F2-AE923D4AB955@osterried.de> <560E8B1C.9030209@eclis.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <560E8B1C.9030209@eclis.ch>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Thomas Osterried <thomas@osterried.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, David Ranch <dranch@trinnet.net>, =?windows-1252?Q?Ralf_B=E4chle_DL5RB?= <ralf@linux-mips.org>, linux-hams@trinnet.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org

Le 02. 10. 15 15:48, Jean-Christian de Rivaz a =E9crit :
> Le 02. 10. 15 12:35, Thomas Osterried a =E9crit :
>
>> I also wonder why userspace processes like kissattach do not get a=20
>> signal by the kernel, indicating that the filedescriptor is not vali=
d=20
>> anymore.
>> Who=92s job would it be to signal, the serial driver=92s (slip, ppp,=
=20
>> mkiss, ..), or ldisc=92s?
>
> It's a complete other problem, not kernel related. The safety of the=20
> kernel cannot depend on a user application closing a file descriptor.=
=20
> Even if the user application close his file descriptor, process=20
> scheduling can make this delayed long enough to let's a packet reach=20
> the parasitic uninitialized interface and completely crash the system=
=2E=20
> This will at best only reduce the race window but do nothing to fix=20
> the real bug. That said, kissattach uses a while (1) { sleep(); } loo=
p=20
> that can be cheaply replaced by a single old select() waiting on the=20
> file descriptor. My understanding is that after the the AX25=20
> discipline is in place the only event that can happen is that the=20
> descriptor is to be closed. I will test a kissattach patch for this.
>
> AFAIK tty_ldisc_hangup() already signal EOF to the file descriptor=20
> owner with these lines:
>
>         wake_up_interruptible_poll(&tty->write_wait, POLLOUT);
>         wake_up_interruptible_poll(&tty->read_wait, POLLIN);
>

I was completely wrong on this. The kissattach application get no event=
=20
at all. I tried with select() and poll().

You are right, something is missing in the kernel to notify EOF in the=20
descriptor of a removed serial device when at least the N_AX25 line=20
discipline is used. The EOF is notified correctly at least in the case=20
of the N_TTY line discipline.

So your question make sense: who must send the EOF ? Maybe it's the lin=
e=20
discipline code.

Greg, Jiri, can you give some hint ?

Best Regards,
Jean-Christian de Rivaz

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
