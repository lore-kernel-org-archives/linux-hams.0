From: Luiz Catalan <catalan@lnx.lfc.mat.br>
Subject: Re: kernel 2.4.21 and AX25 & netrom
Date: Mon, 1 Sep 2003 10:19:06 -0300 (BRT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.51.0309011007460.28473@lnx.lfc.mat.br>
References: <Pine.LNX.4.51.0308301247010.32430@lnx.lfc.mat.br>
 <Pine.LNX.4.50.0309010101460.13869-100000@yossarian.aniota.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.50.0309010101460.13869-100000@yossarian.aniota.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, 1 Sep 2003, terry wrote:

Hello Terry,

> On Sat, 30 Aug 2003, Luiz Catalan wrote:
>
> > kernel 2.4.21
>
> ... ciao:
>
>     first, 2.4.22 is out, and can be found at kernel.org.  i would suggest
> that, as some of the latest security issues have involved lesser versions.

Ok.

> > upgrade to 2.6.0-testX
>
>     just as a matter of principle, going to the 'bleeding edge' of
> technology might not solve as many problems as it introduces.

You're right. Besides, there are several packages that need upgrade before
the new kernel runs correctly. I intended to use the new kernel as a
solution for the current problems in the 2.4.x kernel netrom. I'll test
the 2.6.x it in a separated machine, to not disturb the "production"  one
and to learn more about this new kernel series.

>     perhaps it just my reading, but i am not sure you've actually isolated
> the problem.  is it the kernel, or ax25 ...

Mostly is my poor writing, sorry if not clear enough :) ... the problem
here _is_ the ax25/netrom. The system runs weeks and weeks without problem
if there is no netrom running.  After starting the netrom, start also the
crashes.

> --
> 73 , de WD0FPC		Pacific Nowthwest 2M Repeaters
>     aka: terry 		http://www.aniota.com/~wd0fpc

73 and tks de Luiz - PP5AQ
