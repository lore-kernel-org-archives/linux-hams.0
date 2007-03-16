From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Document request - ROSE protocol specification
Date: Fri, 16 Mar 2007 20:37:21 +0000
Message-ID: <45FB0001.8080102@rns-stearn.demon.co.uk>
References: <45F87682.8010206@rns-stearn.demon.co.uk> <620c90570703141711v444bd67dqd9cf8e86a6fc1b54@mail.gmail.com> <45F92C62.2030707@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <45F92C62.2030707@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Bernard Pidoux wrote:

> ROSE has been described by Tom Moulton W2VY in different ARRL Computer
> Networking Conference proceedings available on CDs (google ROSE W2VY).
> Sorry I only have 3rd (1984), 9th (1990) and 13th (1994) books
>                                                      without ROSE
> protocole descripion.
> 
> ROSE adressing follows the X.121 specs and uses 14 digits.
> 
> There is a good description here :
> http://www.rhyshaden.com/x25.htm
> 
> Linux kernel source provides diagnostic codes and specs.
> For example in /linux/include/net/rose.h :

Bernard

Thank you for your reply.  I think I am going have to follow the X.25
protocol stack upwards and find out what was changed the hard way.  The
good bit is that there is code in wireshark already (in the X.25 dissector)
that implements the PLP, so I will start from there.

-- 
Regards
	Richard
