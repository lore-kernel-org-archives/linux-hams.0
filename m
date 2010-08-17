From: "Bernard, f6bvp" <f6bvp@free.fr>
Subject: Re: netstat caused a SIGSEGV
Date: Tue, 17 Aug 2010 12:10:45 +0200
Message-ID: <4C6A6025.8040109@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Message resent (previous post were rejected for it contained HTML code).

With my previous ROSE patch a segment violation would occur when
rose->state was at a higher level than ROSE_STATE_3.
This was due to an error in rose_state[] array lacking all possible ROSE
states.
The present patch corrects this bug by initializing rose_state[]
correctly according to linux/include/net/rose.h

--- net-tools/netstat.c 2010-08-16 13:47:50.000000000 +0200
+++ net-tools/netstat.c 2010-08-16 13:29:11.000000000 +0200
@@ -504,10 +505,12 @@
#if HAVE_AFROSE
static const char *rose_state[] =
{
- N_("LISTENING"),
- N_("CONN SENT"),
- N_("DISC SENT"),
- N_("ESTABLISHED")
+ N_("READY"),
+ N_("AWAITING CALL ACCEPTED"),
+ N_("AWAITING CLEAR CONFIRMATION"),
+ N_("CONNECTED"),
+ N_("AWAITING RESET CONFIRMATION"),
+ N_("AWAITING CALL ACCEPTANCE")
};

static int rose_info(void)



I updated previous ROSE patch against 1.70 netstat Berlios CVS here :

http://f6bvp.free.fr/logiciels/netstat/net-tools-rose-1.70.diff
http://f6bvp.free.fr/logiciels/netstat/net-tools-netstat-1.70.diff


73 de Bernard, f6bvp

