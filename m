From: David Ranch <linux-hams@trinnet.net>
Subject: Re: AX25 mkiss interface not deleted when the serial port is removed
Date: Tue, 29 Sep 2015 09:49:27 -0700
Message-ID: <560AC117.80406@trinnet.net>
References: <5605828E.5010104@eclis.ch>
 <20150929153129.GA31429@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20150929153129.GA31429@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>, Jean-Christian de Rivaz <jc@eclis.ch>
Cc: linux-hams@vger.kernel.org


Hello Ralf,

Thanks so much for chiming into this thread.

> skb_push is invoked via a code path that was conceptually completly broken
> and has been rewritten recently.  So it would be great if you could retest
> with a recent release version preferably 4.2.  I suspect this is not the
> cause but I'd like to exclude the possibility.

Do you know which commit brought in these specific improvements? I'd 
like to see if Linux kernel 4.1.8 has it.

--David
KI6ZHD
