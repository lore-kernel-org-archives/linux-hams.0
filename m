From: Dave Platt <dplatt@radagast.org>
Subject: Re: fbbsrc.704r5 compile error
Date: Thu, 17 Sep 2009 18:21:33 -0700
Message-ID: <4AB2E09D.5060408@radagast.org>
References: <19EFA90488264123AF73C3EB1EA74B62@ngj>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <19EFA90488264123AF73C3EB1EA74B62@ngj>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jose Ng Lee <jng@psi.net.pa>
Cc: linux-hams@vger.kernel.org


> cc1: error: unrecognized command line option "-fstack-protector-all"

> Please, anyone can help me or what I have to change in the Makefile to
> make it compile OK.

I believe that this option is intended to enable an anti-exploit
"stack guard" feature, to detect deliberate stack-overrun data attacks
against a program which could be used to inject malicious code and take
over the functioning of the computer.  Such stack-smashing attacks are
not uncommon on the Internet - they are or were a fairly common method of
breaking into network-connected PCs.

My guess is that your current Linux system is using a version of the
GNU C compiler which doesn't have this feature, or one in which the
feature name has been changed.  It looks at first Google-glance as
if the stack protector feature is an extension to GCC, not a standard
part of it, and your Fedora Core 4 system apparently doesn't incorporate
this feature.  The author/distributor of FBB apparently had it available
and chose to enable it.

The shortest remedy is probably to grep through the Makefile(s) for fbb
and find the options line which invokes this absent feature, and just
edit it out.

A better remedy would be to upgrade your compiler to one which does
have the stack-canary feature.  If FBB's author/distributor was concerned
enough to enable it, it may indicate the possibility that FBB might have
some code constructs somewhere in it which are vulnerable to deliberate
buffer overruns, due to insufficient validation of incoming data.
