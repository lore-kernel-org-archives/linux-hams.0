From: Ichiro Hieda JE1SGH <lxham@hie.nibh.go.jp>
Subject: Bug fix of ax25-tools-0.0.8 for ppc
Date: Wed, 19 Jun 2002 16:53:28 +0900
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <B9366788.32A3%lxham@hie.nibh.go.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

I posted a bug information to Sourceforge before. When I tried to complie
ax25-tools-0.0.8 on my ppc Linux, compile time error occurred. Today I have
found the problem and solved it.

Three programs, mkiss.c, netromd.c and rip98d.c cause the error that won't
have problem on x86 Linux.

One include line is necessary to the three routines;
#include <sys/time.h>
somewhere on the top portion of them. This solves the problem for ppc and I
believe this is harmless to x86.

So, dear coordinators, please consider adding the include line to the three
routines in the future releases of ax25-tools.

Best wishes,
Ichiro

-- 
Ichiro Hieda / JE1SGH
Email: ihieda at mac.com
http://ocean.kz.tsukuba.ac.jp/%7eje1sgh/


