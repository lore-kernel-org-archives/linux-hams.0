From: Dave Platt <dplatt@radagast.org>
Subject: Re: Issue with RS232 <-> USB adaptor (FC15)
Date: Mon, 13 Jun 2011 14:07:14 -0700
Message-ID: <4DF67C02.4060200@radagast.org>
References: <4DF663E7.7040100@f8arr.org> <4DF66BF8.6090003@shom.fr> <4DF672E6.7050403@f8arr.org> <4DF678B0.1080600@shom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4DF678B0.1080600@shom.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams <linux-hams@vger.kernel.org>

On 06/13/2011 01:53 PM, Bruno Tr=E9guier wrote:
> Le 13/06/2011 =E0 22:28, f8arr a =E9crit :
>> Hello,
>>
>> I'm not sure because I found the problem to resolve my issue :
>>
>> stty --file=3D/dev/ttyUSB0 clocal
>>
>> I remove all flow control on the serial.

I don't think that "clocal" removes flow control (on RTS/CTS) -
that's controlled by a separate option.

What "clocal" does, is "disable modem control signals".
Specifically, for a port marked "-clocal" (not local),
an open() call will block until the device on the port
asserts the CD (carrier detect) line, and if the CD
line is deasserted the port will "hang up".  This is
useful for serial ports connected to dial-up modems,
but not particularly desirable for serial ports being
used to control local devices such as transceiver.

I can't recall whether a -clocal port automagically
asserts DTR even when it isn't open... I don't think so
but I could be wrong.

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
