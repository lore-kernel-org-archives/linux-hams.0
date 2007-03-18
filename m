From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: Document request - ROSE protocol specification
Date: Sun, 18 Mar 2007 11:46:11 +0100
Message-ID: <45FD1873.403@ccr.jussieu.fr>
References: <45F87682.8010206@rns-stearn.demon.co.uk>	 <620c90570703141711v444bd67dqd9cf8e86a6fc1b54@mail.gmail.com>	 <45F92C62.2030707@ccr.jussieu.fr> <620c90570703150642q76cfb326scdca89934a9593a1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570703150642q76cfb326scdca89934a9593a1@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chuck Hast <wchast@gmail.com>
Cc: Richard Stearn <richard@rns-stearn.demon.co.uk>, linux-hams@vger.kernel.org



Chuck Hast wrote:

>...What listen does
> not show is the GFI, it does show the LCI and in the call request packet
> the
> random number  (NbAlea) which is used to assign the LCI. Nor does it show
> the cause/diag code data when there is a error or a disconnect.
> 
> So any work you do in this direction will be a big help for us.
> 
> 

Actually, listen provides some error diagnostic including the point
where the link failed as shown here :

0: fm KP4DJT-9 to F6BVP-11 ctl I72^ pid=1(X.25) len 26
X.25: LCI 031 : CLEAR REQUEST - Cause DTE Originated - Diag 0
at N3PPC-9 @3100,386335
0: fm KP4DJT-9 to F6BVP-11 ctl RR0v

Not so bad.

73 de Bernard, f6bvp
