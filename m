From: mvw@mvw.net
Subject: Re: Canot get serial card working: It worked ONCE.
Date: Tue, 10 Dec 2002 16:41:23 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212101638340.1255-100000@jeeves.mvw.net>
References: <E18Lpdw-0002aB-00@yagi.h-net.msu.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <E18Lpdw-0002aB-00@yagi.h-net.msu.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org

Hi all,

I give up: your sugestions were all helpful but all checked out. Dead 
port I still suspects, so I moved the effort to a difefrent machine. 
Recompiled the kernel, install libax25/ax25-tools/ax25-apps, and added 
/etc/ax25/axports and rc.ax25 with kissattach and routes: hey presto.

For those of you in the GTA, I will soon have this up as another gateway 
for the Toronto area (Oakville, Ontario, near the lake).

One small question: in my logs I see that when I start mheardd, I get a 
message as follows:

	kernel: mheardd uses obsolete (PF_INET,SOCK_PACKET)

...is that anything to worry about?

Michael



