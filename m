From: Tihomir Heidelberg - 9a4gl <9a4gl@hamradio.hr>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Mon, 08 Oct 2007 14:25:28 +0200
Message-ID: <470A21B8.6050307@hamradio.hr>
References: <47093A4E.5040409@hamradio.hr> <20071008104541.GA4924@linux-mips.org>
Reply-To: 9a4gl@hamradio.hr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20071008104541.GA4924@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: Tihomir Heidelberg - 9a4gl <9a4gl@hamradio.hr>, Stephen Hemminger <shemminger@osdl.org>, linux-hams@vger.kernel.org

Hi,

Ralf Baechle DL5RB wrote:
>> I think that:
>>
>> 1. ax25_sendmsg should accept data larger then mtu and pass the data=
 to
>> ax25_output.
>> 2. ax25_output should do fragmentation and queue frames into device =
queue.
>> 3. ax25_output should stop fragmenting when device queue is full
>> 4. ax25_output should return number of bytes queued on device
>> 5. ax25_sendmsg should return number of bytes accepted for xmiting
>>    =20
>
> Agreed.
>
>  =20
Great. Who is going to fix this ? :)
>> Also, as I see, currently ax25 stack is not checking if dev_queue_xm=
it
>> fails. Does this means that AX.25 kernel can loose some frames when
>> device queue is full ?
>>    =20
>
> Yes.  This isn't a bug - packet delivery is unreliable.  But what I'd
> really like to see is the AX.25 stack to throttle itself instead of
> continuing to stuff packets into an overflowing queue.
>
>  =20
Hm, AX.25 connection is unrealible, why ? Shouldn't it be reliable ?
Throttle ? You mean write would block or will return EAGAIN in
non-blocking mode ? That would be nice.

By the way, who is ax25 stack maintainer ? I did some work on AX.25
stack to support AX.25 frame extension needed for node software which
needs to be compatible with SuperVozelj node by Matja=C5=BE Vidmar, S53=
MV.
This node is very popular in Slovenia, Italy and Croatia. I can prepare
patch, the SuperVozelj compatibility will be enabled/disabled in Linux
kernel configuration, and if enabled do not affect other applications.
Where to send the patch and who is doing code review ?

73 de Tihomir, 9a4gl

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
