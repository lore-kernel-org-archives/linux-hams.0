From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: AX25 mkiss interface not deleted when the serial port is removed
Date: Tue, 29 Sep 2015 19:14:03 +0200
Message-ID: <20150929171403.GB31429@linux-mips.org>
References: <5605828E.5010104@eclis.ch>
 <20150929153129.GA31429@linux-mips.org>
 <560AC117.80406@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560AC117.80406@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: Jean-Christian de Rivaz <jc@eclis.ch>, linux-hams@vger.kernel.org

On Tue, Sep 29, 2015 at 09:49:27AM -0700, David Ranch wrote:

> >skb_push is invoked via a code path that was conceptually completly broken
> >and has been rewritten recently.  So it would be great if you could retest
> >with a recent release version preferably 4.2.  I suspect this is not the
> >cause but I'd like to exclude the possibility.
> 
> Do you know which commit brought in these specific improvements? I'd like to
> see if Linux kernel 4.1.8 has it.

It's Eric Biederman's series 1d5da757da860a6916adbf68b09e868062b4b3b8 and
preceeding commits.  It's in kernel 4.1 and newer.

  Ralf
