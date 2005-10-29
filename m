From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: txdelay and kissparms hardware question
Date: Sat, 29 Oct 2005 21:43:57 +0100
Message-ID: <20051029204357.GD2935@linux-mips.org>
References: <60418.192.168.1.2.1130098885.squirrel@192.168.1.12>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <60418.192.168.1.2.1130098885.squirrel@192.168.1.12>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aa6qn@aa6qn.sytes.net
Cc: linux-hams@vger.kernel.org

On Sun, Oct 23, 2005 at 01:21:25PM -0700, aa6qn@aa6qn.sytes.net wrote:

> I am wondering is kissparms configuration is really working for me. I have
> made adjustments and there seems to be no change in the tnc timing. For
> instance if I set txdelay to -t 30 the tnc acts as if it was set to 10ms.
> I am wondering if the timing is effected by the faster machines available
> today. In my case its a Intel 4, 3.2Ghz hyperthreading dual channel SMP
> image. Could this hardware also be the cause of my kernel panic's when I
> load ax25?

In case you're using the kiss driver the kernel should just forward this
setting to your TNC which then controls the actual tx delay.  Other drivers
such as 6pack do the tx delay themselves.  So, what driver are you using?

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
