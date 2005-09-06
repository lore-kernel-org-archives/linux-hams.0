From: "David S. Miller" <davem@davemloft.net>
Subject: Re: [AX.25] Make ax2asc thread-proof
Date: Tue, 06 Sep 2005 15:49:53 -0700 (PDT)
Message-ID: <20050906.154953.44159520.davem@davemloft.net>
References: <20050906181222.GA451@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050906181222.GA451@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ralf@linux-mips.org
Cc: netdev@vger.kernelorg, linux-hams@vger.kernel.org

From: Ralf Baechle <ralf@linux-mips.org>
Date: Tue, 6 Sep 2005 19:12:22 +0100

> Ax2asc was still using a static buffer for all invocations which isn't
> exactly SMP-safe.  Change ax2asc to take an additional result buffer as
> the argument.  Change all callers to provide such a buffer.
> 
> Signed-off-by: Ralf Baechle DL5RB <ralf@linux-mips.org>

Applied, thanks a lot Ralf.
