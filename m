From: Pidoux <f6bvp@free.fr>
Subject: Re: ax25 route question.
Date: Sat, 15 Nov 2008 14:52:40 +0100
Message-ID: <491ED428.5080509@free.fr>
References: <E2CCEDF0-B717-4266-AAA3-06AC1B1E3B9C@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <E2CCEDF0-B717-4266-AAA3-06AC1B1E3B9C@tssg.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Ronan <jronan@tssg.org>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

Hi John,

I did not see any reply to your question.
Personnally I don't know if the example you gave is correct and would work.
But you may have perfomed some tests already ?
I would say that, as far as AX25 routing is concerned, there are a number of possibilities, using higher level routing 
facilities, such as node, flexnet or FPAC (based on ROSE network protocol).
I am more familiar with ROSE/FPAC that uses a very efficient routing algorithm and white pages at the cost of only three 
more bytes per AX25 frames.
You could find some documentation about FPAC here

http://ftp.f6fbb.org/fpac/doc/FPAC-HOWTO.html#toc1
http://rose.fpac.free.fr/MINI-HOWTO/


73 de Bernard, f6bvp
http://f6bvp.org



John Ronan wrote :
> Could someone give an example of how ax25 routes are supposed to work? 
> I've been trying to figure this out.
> 
> My understanding (which could be wrong) was that If I did
> 
> axparms -route add myport calla digia
> 
> that if I did
> axcall calla
> 
> that the outgoing connect would be directed through digia
> 
> Is my understanding incorrect?
> 
> Regards
> de John
> EI7IG
> 
> -- 
> John Ronan <jronan@tssg.org>, +353-51-302938
> Telecommunications Software &  Systems Group,  http://www.tssg.org
> 
> 
> 


