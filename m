From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: Re: AX25 mkiss interface not deleted when the serial port is removed
Date: Wed, 30 Sep 2015 02:29:35 +0200
Message-ID: <560B2CEF.4060209@eclis.ch>
References: <5605828E.5010104@eclis.ch> <20150929153129.GA31429@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20150929153129.GA31429@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>, linux-hams@trinnet.net
Cc: linux-hams@vger.kernel.org, thomas@osterried.de

Le 29. 09. 15 17:31, Ralf Baechle DL5RB a =E9crit :
> On Fri, Sep 25, 2015 at 07:21:18PM +0200, Jean-Christian de Rivaz wro=
te:
>
>> On a embedded system we use AX25 over an USB serial port with the ki=
ssattach
>> command. For some hardware reason the microcontroller that act as a =
TNC and
>> USB CDC device can be rested while the system is running, causing a =
USB
>> disconnect of the USN CDC device and the removal of the correspondin=
g serial
>> port in the kernel. But the ax0 interface is not removed in this cas=
e and
>> after a few seconds the kernel panic with the crash below:
>>
>> [<c0595468>] (skb_panic) from [<c0401f70>] (skb_push+0x4c/0x50)
>> [<c0401f70>] (skb_push) from [<bf0bdad4>] (ax25_hard_header+0x34/0xf=
4
>> [ax25])
>> [<bf0bdad4>] (ax25_hard_header [ax25]) from [<bf0d05d4>]
>> (ax_header+0x38/0x40 [mkiss])
>> [<bf0d05d4>] (ax_header [mkiss]) from [<c041b584>]
>> (neigh_compat_output+0x8c/0xd8)
>> [<c041b584>] (neigh_compat_output) from [<c043e7a8>]
>> (ip_finish_output+0x2a0/0x914)
>> [<c043e7a8>] (ip_finish_output) from [<c043f948>] (ip_output+0xd8/0x=
f0)
>> [<c043f948>] (ip_output) from [<c043f04c>] (ip_local_out_sk+0x44/0x4=
8)
> skb_push is invoked via a code path that was conceptually completly b=
roken
> and has been rewritten recently.  So it would be great if you could r=
etest
> with a recent release version preferably 4.2.  I suspect this is not =
the
> cause but I'd like to exclude the possibility.

Hi Ralf,

Unfortunately the kernel 4.3.0-rc3+ crash the same way. I suspect that=20
the real question is: what in ax25/mkiss make tty_ldisc_hangup() callin=
g=20
tty_ldisc_open() on a serial port that no longer exists, and how to=20
avoid this ?

Regards,
Jean-Christian
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
