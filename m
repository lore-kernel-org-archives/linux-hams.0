From: Dave Platt <dplatt@radagast.org>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Mon, 08 Oct 2007 17:59:31 -0700
Message-ID: <470AD273.40007@radagast.org>
References: <47093A4E.5040409@hamradio.hr> <20071008082900.GB24782@cloud.net.au> <470A1035.5070900@hamradio.hr> <20071008134447.GA30451@cloud.net.au> <470A4456.6000703@hamradio.hr> <20071008223646.GC15879@cloud.net.au> <470AB8DA.8020301@radagast.org> <470ACEA0.1080307@dimebank.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <470ACEA0.1080307@dimebank.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

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
> 
> So it depends entirely on what the application level is trying to do.

Quite right!  I think that there are plenty of places for both
sorts of protocols.

I do think that having SOCK_STREAM available for AX.25 would be a good
idea.  It would make it easier for TCP-based applications to be ported
over to AX.25.

