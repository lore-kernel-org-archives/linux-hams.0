From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Problem...
Date: Wed, 26 Mar 2003 00:46:33 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030326004633.A5531@pull.privacy.nb.ca>
References: <GMEHKCCPLOCMPOLBMKICCEJNDOAA.hremijn@zeelandnet.nl> <3E8086E6.3000709@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3E8086E6.3000709@ccr.jussieu.fr>; from pidoux@ccr.jussieu.fr on Tue, Mar 25, 2003 at 05:42:14PM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bernard pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

On Tue, Mar 25, 2003 at 05:42:14PM +0100, bernard pidoux wrote:
> 
> I was not able to achieve a normal functionning of Linux as soon as AX25 
> was set up with mkiss connexions with any of 2.4.xx kernels. And I tried 
> with different PCs.
> In 2.4 kernel, there are major problems with interruptions (and kernel 
> panics after a few minutes or hours) that should be corrected in kernel 
> version under development (actually around 2.5.65) leading to a possible 
> return to correct functionning (I hope) in [2.6.x -ve1mct] kernel.

Bugs can only be fixed if people take the time to make a bug report.

There are developers here willing to help you if you need assistance
with finding the cause of the problem. (Myself included, though I am
not a kernel developer)

One thing I would really like to know is if certain protocols cause
problems, i.e. does plain AX.25 cause problem, or NetRom traffic,
what about AXIP traffic? Did you have a large route table (that is,
are your an AMPRnet gateway)? Any idea of the CPU load when the kernel
panic occured? Was there multiple connections/traffic on different or 
same RF ports? Error messages in the syslog or messages file relating
to networking or amateur radio stuff?

The problems that exist in the 2.4 kernel also exist in the 2.2 kernel,
it is just that there are harder to trigger. They will become worst in
2.5/2.6 unless they are fixed, so the best time is now, while 2.5 is
still a development kernel.

Thank you,
ve1mct
