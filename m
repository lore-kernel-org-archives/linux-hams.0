From: =?iso-8859-1?q?=D8yvind=20Hanssen?= <oyvind@cs.uit.no>
Subject: Re: INP3 patch + yam = kernel oops
Date: Sat, 5 Apr 2003 00:28:40 +0200
Sender: linux-hams-owner@localhost
Message-ID: <200304050028.40766.oyvind@cs.uit.no>
References: <200304022112.07835.oyvind@cs.uit.no> <20030404235522.E1131@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030404235522.E1131@jeroen.pe1rxq.ampr.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeroen Vreeken <pe1rxq@amsat.org>, linux-hams@vger.kernel.org

Thanks for the response. I just booted a new kernel (2.4.20),=20
with Yam and INP3 patch and it seems to be working well now,=20
except that the patched nrattach does not seem to find the nrports file=
=2E=20
I'll sort it out soon.=20

Riley Williams suggested to try the 2.4.20 and there are some
fixes to the Yam driver. I guess I might also have confused the=20
system by not actually booting the modified kernel, just replacing
the modules. I suspect there was a little problem in the Yam code.
Well, 2.4.20 seems to be ok.=20

It would be nice if we could improve the kernel AX.25 support. You=20
and others has made some nice patches which could perhaps be=20
included into the mainstream kernel??=20

73 de LA7ECA, =D8yvind

> Its a fix for a prblem with earlier 2.4 kernels that would crash as a=
lmost
> immediatly.
>
> I haven't tried the patch on a 'real' 2.4.19 source yet so it could b=
e the
> cause...
> But ax25 in 2.4 is terribly broken :(
>
> On a side note does anybody know how the status of ax25 in 2.5 is?
> I know there have been some changes, but I don't get replies from any=
 mails
> to the author....
>
> I just want to know if it is just as likely to crash as 2.4, more lik=
ely or
> is it getting better?
> In other words is it worth to try??? What needs to be done? Can I hel=
p???
>
> 	Jeroen
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
