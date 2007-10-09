From: Tihomir Heidelberg - 9a4gl <9a4gl@hamradio.hr>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Tue, 09 Oct 2007 08:47:05 +0200
Message-ID: <470B23E9.4070303@hamradio.hr>
References: <47093A4E.5040409@hamradio.hr> <20071008082900.GB24782@cloud.net.au> <470A1035.5070900@hamradio.hr> <20071008134447.GA30451@cloud.net.au> <470A4456.6000703@hamradio.hr> <20071008223646.GC15879@cloud.net.au> <470AB8DA.8020301@radagast.org> <470ACEA0.1080307@dimebank.com>
Reply-To: 9a4gl@hamradio.hr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <470ACEA0.1080307@dimebank.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Kantarjiev <cak@dimebank.com>
Cc: linux-hams@vger.kernel.org

Hi,

Chris Kantarjiev wrote:
>
>> That's why I'd favor using SOCK_STREAM for AX.25 connections (just
>> as TCP uses SOCK_STREAM) - there's no requirement with SOCK_STREAM
>> that the sender and receiver coordinate on the size of the largest
>> write operation.  This would seem to ease the software compatibility
>> problem quite a bit!
>
> But TCP is a reliable stream, without internal record delimeters.
> SOCK_SEQPACKET is meant to retain the record delimiters and make them
> visible to the endpoints.

In TCP there ARE some kind of record delimiters, the PUSH flags. Take a
look n RFC793 at chapter 2.8. It is probably not used to implement
fragmented SOCK_SEQPACKET because it is not guaranteed that receiver
will get whole packet, but only that the end of the packet will not
finish somewhere in middle of some data. Also, a lot of TCP stacks used
(especially in embedded devices) do not support usage of PUSH flag.

What I wanted to say, AX.25 protocol is not capable of doing
SOCK_SEQPACKET because any node in chain can split packet due to lower
paclen, so SOCK_STREAM is only doable in AX.25 world. Before 2.6.2 we
had SOCK_STREAM behavior, but it was named as SOCK_SEQPACKET. After
2.6.2 we have SOCK_SEQPACKET that behaves like somewhere between :)

I agree with Dave that adding SOCK_STREAM will solve this problem and
then we have a bit compatibility issue.

73 de Tihomir Heidelberg, 9a4gl



