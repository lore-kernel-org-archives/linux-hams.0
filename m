From: Ralf Baechle DO1GRB <ralf@uni-koblenz.de>
Subject: Re: KJD 2.3.9 patch on 2.5.29
Date: Fri, 2 Aug 2002 02:32:37 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020802023237.B28097@dea.linux-mips.net>
References: <20020801194618.GA722@columbia.g7iii.bogus>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020801194618.GA722@columbia.g7iii.bogus>; from g7iii@g7iii.demon.co.uk on Thu, Aug 01, 2002 at 08:46:18PM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Iain Young - G7III <g7iii@g7iii.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On Thu, Aug 01, 2002 at 08:46:18PM +0100, Iain Young - G7III wrote:

> With the AX25 status on 2.5/2.6 thread, and Tomi mentioning the
> KJD patch, I decided to see how much work would be involved in
> porting it to 2.5
> 
> (since the AX25 stack hasn't been touched much for a while, I
> thought it would be easier than other subsystems, that have had
> constant change).

Definately not.  The whole AX.25, NET/ROM and ROSE code is suffering from
severe bitrot.  None of the internal data structures are properly locked
etc.  I'm currently working on that.

So you may find it easy to get old code into the current kerrnel - but
then it'll suffer from the same problems.  The fact is that the AX.25
code is looking like it was written for a 2.0 or 2.2 kernel ...

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
