From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: Re: [PATCH 1/1] Add poll method to mkiss let notify hangup to the
 user process.
Date: Sat, 03 Oct 2015 03:02:32 +0200
Message-ID: <560F2928.3080102@eclis.ch>
References: <560EBE07.70801@eclis.ch> <1443822373-18395-1-git-send-email-jc@eclis.ch> <560F217B.6020106@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <560F217B.6020106@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>, Thomas Osterried <thomas@osterried.de>, Ralf Baechle DL5RB <ralf@linux-mips.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Peter Hurley <peter@hurleysoftware.com>
Cc: linux-hams@vger.kernel.org

Le 03. 10. 15 02:29, David Ranch a =E9crit :
>
> Hello Jean-Christian, Everyone,
>
> Thanks for working on this as I'm pretty sure I've bit hit by this=20
> panic as well though I wasn't able to reproduce it more readily.=20
> Anyway, if this is the proper fix moving forward, will the kernel not=
=20
> panic even if kissattach is not updated?

Hello David,

The kernel will still panic and crash the system. The patch purpose is=20
only to allow hangup notification to the user space. It has the side=20
effect to reduce the race window of the panic&crash only if the user=20
application get the hangup notification and close the file descriptor.=20
The window is reduced in that case, but the window still exists.

Even with this patch and the user space application patch, the kernel i=
s=20
still unsafe, as a packet can still reach the parasitic AX25 interface=20
in the time between the kiss_open() in the kernel and the close() in th=
e=20
user application. More important, as I stated before, safety of the=20
kernel cannot depend on a user space application closing a file=20
descriptor. A fix to prevent mkiss_open() call on a removed serial=20
device is still needed. I proposed patches and options, but to date I=20
only get two critics and no hint on how to solve the problem. The tty=20
maintainers stay silent.

> Can you also include the needed patch for the kissattach program to=20
> complete this solution?

Yes, it was posted a few minutes before in the linux-hams mailing list=20
only because it don't concern the kernel mailing list:

http://www.spinics.net/lists/linux-hams/msg03520.html

Jean-Christian
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
