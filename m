From: walter harms <wharms@bfs.de>
Subject: Re: [Fwd: Re: Quick node question]
Date: Thu, 20 Nov 2008 18:07:30 +0100
Message-ID: <49259952.6010204@bfs.de>
References: <49255868.7010304@comcast.net>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <49255868.7010304@comcast.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Willie Hein WJ3G <wj3g@comcast.net>
Cc: Linux Hams Mailing list <linux-hams@vger.kernel.org>


are you using syslog() or do you send direcly to the socket ?
when using syslog() you can try to overload it with printf() and
see if it happens again.

re,
 wh


socket(PF_FILE, SOCK_DGRAM, 0)          = 3
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
connect(3, {sa_family=AF_FILE, path="/dev/log"}, 110) = 0
send(3, "<187>Nov 20 06:58:52 node[16855]"..., 68, MSG_NOSIGNAL) = 68
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++




Willie Hein WJ3G schrieb:
> Here are the result of running strace. Hope someone can tell me what I'm
> doing wrong.
> 
> Willie, WJ3G
