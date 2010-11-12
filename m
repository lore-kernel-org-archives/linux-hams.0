From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: xfbbd oddness.
Date: Fri, 12 Nov 2010 13:23:50 -0800
Message-ID: <4CDDB066.4040801@junglevision.com>
References: <Pine.LNX.4.64.1005271432450.5422@ask.diku.dk> <20100527.162919.115912825.davem@davemloft.net> <4CD99C63.4030406@junglevision.com> <4CDA0972.40108@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CDA0972.40108@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: bernard.pidoux@upmic.fr

Actually, I think ignoring the SIGPIPE and other signals
does fix a real problem.   I changed this, and I ran
about a day with no SIGPIPE faults -- that is with
frequent connects from an actual RF-based AX25 connection.
No functionality is lost by ignore these signals, so I think
I will send in a patch for this at some point.

With this one patch, I think xfbbd is basically usable for
me on RF connections.


There still is a bug.  After awhile, I start seeing...

select: Bad file descriptor
select: Bad file descriptor
select: Bad file descriptor
select: Bad file descriptor

and then the system bugs out.  The script normally restarts
it, though I'm running from gdb myself so for me it just dies.



Via google, I see someone reported this bug back in 2004.  That
was 6 years ago, so it is obviously a very old bug.
At least it's consistent, I suppose.
