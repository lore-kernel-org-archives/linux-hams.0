From: =?iso-8859-1?q?=D8yvind=20Hanssen?= <oyvind@cs.uit.no>
Subject: AX.25 kernel module development
Date: Tue, 8 Apr 2003 14:36:15 +0200
Sender: linux-hams-owner@localhost
Message-ID: <200304081436.15919.oyvind@cs.uit.no>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Please excuse me if this has been discussed before..=20

There are some talk here about that the AX.25 Linux kernel code is brok=
en.=20
There has been attempts to create patches for the kernel; some are good=
 but
arent (yet) included in the mainstream kernel, and there has been a ser=
ious=20
attempt to rewrite the kernel stack as well (?) And it seems to be some=
=20
uncertainty wrt. what is happening in Linux 2.5 (?)

It seem complicated to maintain patches for the Linux kernel the=20
way it has been done, and I notice that someone has even suggested to=20
implement the whole thing in userspace instead, at least to make it eas=
ier
to develop new protocols and drivers...=20

What about keeping the core AX.25 stuff and drivers in kernel but split=
 it
out from the mainstream Linux codebase and do the development in a sepa=
rate
project instead; like e.g. the ALSA project has done until now? I guess=
=20
that it would be easier to compile, maintain and add features to such=20
a package than getting patches accepted for the mainstream Linux kernel=
=2E=20

It is possible that a small part must remain in the kernel (socket API?=
), but
we shouldnt need to change this part too often.=20

73 de LA7ECA, =D8yvind
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
