From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: INP3 patch + yam = kernel oops
Date: Sat, 5 Apr 2003 01:08:25 +0200
Sender: linux-hams-owner@localhost
Message-ID: <20030405010825.G1131@jeroen.pe1rxq.ampr.org>
References: <200304022112.07835.oyvind@cs.uit.no> <20030404235522.E1131@jeroen.pe1rxq.ampr.org> <200304050028.40766.oyvind@cs.uit.no>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200304050028.40766.oyvind@cs.uit.no>; from oyvind@cs.uit.no on Sat, Apr 05, 2003 at 00:28:40 +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?=D8yvind_Hanssen?= <oyvind@cs.uit.no>
Cc: linux-hams@vger.kernel.org

On 2003.04.05 00:28:40 +0200 =D8yvind Hanssen wrote:
> Thanks for the response. I just booted a new kernel (2.4.20),=20
> with Yam and INP3 patch and it seems to be working well now,=20
> except that the patched nrattach does not seem to find the nrports fi=
le.=20
> I'll sort it out soon.=20

It probably looking in /usr/local/etc/ax25 instead of /etc/ax25 or vice
versa.
You can set it with configure before compiling.
(Or make one a symlink to the other like I did to prevent future mistak=
es
:)

	Jeroen

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
