From: =?iso-8859-1?q?=D8yvind=20Hanssen?= <oyvind@cs.uit.no>
Subject: Re: remote TNC
Date: Wed, 25 Dec 2002 23:15:34 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200212252315.35178.oyvind@cs.uit.no>
References: <Pine.LNX.4.44.0212252335330.4691-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212252335330.4691-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

I have also been thinking about this, specifically, I was thinking
about using Xastir on my laptop while the radio was running on=20
another computer.=20

I modfied the aprs_tty program by PE1DNN to use stdin/stdout
instead of a pty. Then I was able to use ssh to run this on the
computer with the radio and redirect i/o to the other end. I believe
it is possible to redirect the client end of ssh to a pty such that
Xastir can connect it. I havent managed to get it working yet
but it should not be too hard.=20

Better though, I believe one could modify Xastir to fork off=20
an external command and redirecting is i/o to a pipe etc. etc.

Of course, axip is a more generic solution, but with Xastir we
need the aprs_tty program anyway (if not running Xastir as root).=20

73 de LA7ECA, =D8yvind=20

> Here you will have to use AXIP but I think you can still get the same=
 as
> in hte above with rxecho.
[...]
--=20
Associate Professor, Computer Science dept., University of Troms=F8
oyvind@cs.uit.no, http://hans.priv.no/oivindh
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
